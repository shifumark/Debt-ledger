import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/debtors_table.dart';
import '../tables/transactions_table.dart';

part 'transaction_dao.g.dart';

class TransactionTypeFilter {
  const TransactionTypeFilter({this.types, this.debtorId, this.searchTerm});

  final Set<TransactionTypeColumn>? types;
  final int? debtorId;
  final String? searchTerm;
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
    final loanExpr = CaseWhenExpression<double>(
      cases: [
        CaseWhen(transactions.type.equalsValue(TransactionTypeColumn.loan),
            then: transactions.amount),
      ],
      orElse: const Constant(0),
    ).sum();
    final paymentExpr = CaseWhenExpression<double>(
      cases: [
        CaseWhen(transactions.type.equalsValue(TransactionTypeColumn.payment),
            then: transactions.amount),
      ],
      orElse: const Constant(0),
    ).sum();

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
