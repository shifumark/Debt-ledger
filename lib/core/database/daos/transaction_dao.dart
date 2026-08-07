import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/debtors_table.dart';
import '../tables/transactions_table.dart';

part 'transaction_dao.g.dart';

class TransactionTypeFilter {
  const TransactionTypeFilter({
    this.types,
    this.debtorId,
    this.searchTerm,
    this.startDate,
    this.endDate,
  });

  final Set<TransactionTypeColumn>? types;
  final int? debtorId;
  final String? searchTerm;
  final DateTime? startDate;
  final DateTime? endDate;
}

class MonthlyCollectionRow {
  const MonthlyCollectionRow({required this.month, required this.total});

  /// 1-12
  final int month;
  final double total;
}

class AnnualCollectionRow {
  const AnnualCollectionRow({required this.year, required this.total});

  final int year;
  final double total;
}

@DriftAccessor(tables: [Transactions, Debtors])
class TransactionDao extends DatabaseAccessor<AppDatabase> with _$TransactionDaoMixin {
  TransactionDao(super.db);

  Future<TransactionRow> insertTransaction(TransactionsCompanion entry) async {
    final id = await into(transactions).insert(entry);
    return (select(transactions)..where((t) => t.id.equals(id))).getSingle();
  }

  Future<bool> updateTransaction(TransactionsCompanion entry) =>
      update(transactions).replace(entry);

  Future<int> deleteTransaction(int id) =>
      (delete(transactions)..where((t) => t.id.equals(id))).go();

  Future<TransactionRow?> getTransactionById(int id) =>
      (select(transactions)..where((t) => t.id.equals(id))).getSingleOrNull();

  Stream<List<TransactionRow>> watchTransactionsForDebtor(
    int debtorId, {
    required int limit,
    required int offset,
  }) {
    return (select(transactions)
          ..where((t) => t.debtorId.equals(debtorId))
          ..orderBy([(t) => OrderingTerm.desc(t.date)])
          ..limit(limit, offset: offset))
        .watch();
  }

  Stream<List<TransactionRow>> watchAllTransactions({
    required int limit,
    required int offset,
    TransactionTypeFilter? filter,
  }) {
    final query = select(transactions);
    if (filter?.types != null && filter!.types!.isNotEmpty) {
      query.where((t) => t.type.isInValues(filter.types!));
    }
    if (filter?.debtorId != null) {
      query.where((t) => t.debtorId.equals(filter!.debtorId!));
    }
    if (filter?.searchTerm != null && filter!.searchTerm!.trim().isNotEmpty) {
      final pattern = '%${filter.searchTerm!.trim()}%';
      query.where((t) => t.description.like(pattern) | t.reason.like(pattern));
    }
    if (filter?.startDate != null) {
      query.where((t) => t.date.isBiggerOrEqualValue(filter!.startDate!));
    }
    if (filter?.endDate != null) {
      query.where((t) => t.date.isSmallerOrEqualValue(filter!.endDate!));
    }
    query
      ..orderBy([(t) => OrderingTerm.desc(t.date)])
      ..limit(limit, offset: offset);
    return query.watch();
  }

  Stream<double> watchBalanceForDebtor(int debtorId) {
    final balanceExpr = _balanceCaseExpression().sum();
    final query = selectOnly(transactions)
      ..addColumns([balanceExpr])
      ..where(transactions.debtorId.equals(debtorId));
    return query.watchSingle().map((row) => row.read(balanceExpr) ?? 0);
  }

  Future<double> calculateBalance(int debtorId) async {
    final balanceExpr = _balanceCaseExpression().sum();
    final query = selectOnly(transactions)
      ..addColumns([balanceExpr])
      ..where(transactions.debtorId.equals(debtorId));
    final row = await query.getSingle();
    return row.read(balanceExpr) ?? 0;
  }

  /// Total outstanding balance across all (non-archived) debtors, plus
  /// count breakdowns, for the dashboard summary.
  Future<DashboardTotals> calculateDashboardTotals() async {
    final balanceExpr = _balanceCaseExpression().sum();
    final loanExpr = _typeAmountCaseExpression(TransactionTypeColumn.loan).sum();
    final paymentExpr = _typeAmountCaseExpression(TransactionTypeColumn.payment).sum();

    final query = selectOnly(transactions)
      ..join([
        innerJoin(debtors, debtors.id.equalsExp(transactions.debtorId)),
      ])
      ..addColumns([balanceExpr, loanExpr, paymentExpr])
      ..where(debtors.isArchived.equals(false));
    final row = await query.getSingle();

    return DashboardTotals(
      totalOutstanding: row.read(balanceExpr) ?? 0,
      totalLent: row.read(loanExpr) ?? 0,
      totalReceived: row.read(paymentExpr) ?? 0,
    );
  }

  /// Reactive version of [calculateDashboardTotals] — re-emits whenever any
  /// transaction or debtor changes, so the dashboard stays live instead of
  /// showing a snapshot from whenever it first loaded.
  Stream<DashboardTotals> watchDashboardTotals() {
    final balanceExpr = _balanceCaseExpression().sum();
    final loanExpr = _typeAmountCaseExpression(TransactionTypeColumn.loan).sum();
    final paymentExpr = _typeAmountCaseExpression(TransactionTypeColumn.payment).sum();

    final query = selectOnly(transactions)
      ..join([
        innerJoin(debtors, debtors.id.equalsExp(transactions.debtorId)),
      ])
      ..addColumns([balanceExpr, loanExpr, paymentExpr])
      ..where(debtors.isArchived.equals(false));

    return query.watchSingle().map((row) => DashboardTotals(
          totalOutstanding: row.read(balanceExpr) ?? 0,
          totalLent: row.read(loanExpr) ?? 0,
          totalReceived: row.read(paymentExpr) ?? 0,
        ));
  }

  Expression<double> _typeAmountCaseExpression(TransactionTypeColumn type) {
    return CaseWhenExpression<double>(
      cases: [
        CaseWhen(transactions.type.equalsValue(type), then: transactions.amount),
      ],
      orElse: const Constant(0),
    );
  }

  Future<double> calculateTotalForgiven() async {
    final forgivenExpr = CaseWhenExpression<double>(
      cases: [
        CaseWhen(transactions.type.equalsValue(TransactionTypeColumn.forgiveness),
            then: transactions.amount),
      ],
      orElse: const Constant(0),
    ).sum();
    final query = selectOnly(transactions)..addColumns([forgivenExpr]);
    final row = await query.getSingle();
    return row.read(forgivenExpr) ?? 0;
  }

  /// Distinct calendar years (as ints) that have at least one transaction,
  /// most recent first — used to populate report year pickers.
  Future<List<int>> availableTransactionYears() async {
    final rows = await customSelect(
      "SELECT DISTINCT strftime('%Y', date, 'unixepoch') AS year FROM transactions ORDER BY year DESC",
      readsFrom: {transactions},
    ).get();
    return rows
        .map((r) => int.parse(r.read<String>('year')))
        .toList(growable: false);
  }

  Future<List<MonthlyCollectionRow>> monthlyCollections({required int year}) async {
    final rows = await customSelect(
      '''
      SELECT strftime('%m', date, 'unixepoch') AS month, COALESCE(SUM(amount), 0) AS total
      FROM transactions
      WHERE type = ? AND strftime('%Y', date, 'unixepoch') = ?
      GROUP BY month
      ORDER BY month
      ''',
      variables: [
        Variable.withInt(TransactionTypeColumn.payment.index),
        Variable.withString(year.toString()),
      ],
      readsFrom: {transactions},
    ).get();
    return rows
        .map((r) => MonthlyCollectionRow(
              month: int.parse(r.read<String>('month')),
              total: r.read<double>('total'),
            ))
        .toList(growable: false);
  }

  Future<List<AnnualCollectionRow>> annualCollections() async {
    final rows = await customSelect(
      '''
      SELECT strftime('%Y', date, 'unixepoch') AS year, COALESCE(SUM(amount), 0) AS total
      FROM transactions
      WHERE type = ?
      GROUP BY year
      ORDER BY year DESC
      ''',
      variables: [Variable.withInt(TransactionTypeColumn.payment.index)],
      readsFrom: {transactions},
    ).get();
    return rows
        .map((r) => AnnualCollectionRow(
              year: int.parse(r.read<String>('year')),
              total: r.read<double>('total'),
            ))
        .toList(growable: false);
  }

  Expression<double> _balanceCaseExpression() {
    return CaseWhenExpression<double>(
      cases: [
        CaseWhen(
          transactions.type.equalsValue(TransactionTypeColumn.loan),
          then: transactions.amount,
        ),
        CaseWhen(
          transactions.type.equalsValue(TransactionTypeColumn.payment),
          then: -transactions.amount,
        ),
        CaseWhen(
          transactions.type.equalsValue(TransactionTypeColumn.adjustment) &
              transactions.adjustmentDirection
                  .equalsValue(AdjustmentDirectionColumn.increase),
          then: transactions.amount,
        ),
        CaseWhen(
          transactions.type.equalsValue(TransactionTypeColumn.adjustment) &
              transactions.adjustmentDirection
                  .equalsValue(AdjustmentDirectionColumn.decrease),
          then: -transactions.amount,
        ),
        CaseWhen(
          transactions.type.equalsValue(TransactionTypeColumn.forgiveness),
          then: -transactions.amount,
        ),
      ],
      orElse: const Constant(0),
    );
  }
}

class DashboardTotals {
  const DashboardTotals({
    required this.totalOutstanding,
    required this.totalLent,
    required this.totalReceived,
  });

  final double totalOutstanding;
  final double totalLent;
  final double totalReceived;
}
