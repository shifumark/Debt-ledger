import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/debtors_table.dart';
import '../tables/transactions_table.dart';

part 'debtor_dao.g.dart';

enum DebtorSortField { name, dateAdded, balance, updatedAt }

@DriftAccessor(tables: [Debtors, Transactions])
class DebtorDao extends DatabaseAccessor<AppDatabase> with _$DebtorDaoMixin {
  DebtorDao(super.db);

  Future<DebtorRow> insertDebtor(DebtorsCompanion entry) async {
    final id = await into(debtors).insert(entry);
    return (select(debtors)..where((t) => t.id.equals(id))).getSingle();
  }

  Future<bool> updateDebtor(DebtorsCompanion entry) => update(debtors).replace(entry);

  Future<int> setArchived(int id, bool archived) {
    return (update(debtors)..where((t) => t.id.equals(id))).write(
      DebtorsCompanion(
        isArchived: Value(archived),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<DebtorRow?> getDebtorById(int id) =>
      (select(debtors)..where((t) => t.id.equals(id))).getSingleOrNull();

  Stream<List<DebtorRow>> watchDebtors({
    bool includeArchived = false,
    DebtorSortField sortField = DebtorSortField.name,
    bool ascending = true,
  }) {
    final query = select(debtors);
    if (!includeArchived) {
      query.where((t) => t.isArchived.equals(false));
    }
    switch (sortField) {
      case DebtorSortField.name:
        query.orderBy([
          (t) => OrderingTerm(
                expression: t.fullName.collate(Collate.noCase),
                mode: ascending ? OrderingMode.asc : OrderingMode.desc,
              ),
        ]);
      case DebtorSortField.dateAdded:
        query.orderBy([
          (t) => OrderingTerm(
                expression: t.dateAdded,
                mode: ascending ? OrderingMode.asc : OrderingMode.desc,
              ),
        ]);
      case DebtorSortField.updatedAt:
        query.orderBy([
          (t) => OrderingTerm(
                expression: t.updatedAt,
                mode: ascending ? OrderingMode.asc : OrderingMode.desc,
              ),
        ]);
      case DebtorSortField.balance:
        // Balance isn't a column on this table; callers combine
        // watchDebtors() with watchBalancesByDebtor() and sort client-side.
        query.orderBy([
          (t) => OrderingTerm(
                expression: t.fullName.collate(Collate.noCase),
                mode: OrderingMode.asc,
              ),
        ]);
    }
    return query.watch();
  }

  /// Signed balance per debtor: loan(+), payment(-), adjustment(+/- by
  /// direction), forgiveness(-). Positive means the debtor owes the
  /// creditor money.
  Stream<Map<int, double>> watchBalancesByDebtor() {
    final balanceExpr = _balanceCaseExpression();
    final query = selectOnly(transactions)
      ..addColumns([transactions.debtorId, balanceExpr])
      ..groupBy([transactions.debtorId]);
    return query.watch().map((rows) {
      final map = <int, double>{};
      for (final row in rows) {
        final debtorId = row.read(transactions.debtorId);
        final balance = row.read(balanceExpr);
        if (debtorId != null) map[debtorId] = balance ?? 0;
      }
      return map;
    });
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
    ).sum();
  }

  Future<List<DebtorRow>> searchDebtors(String query, {int limit = 50}) {
    final pattern = '%$query%';
    return (select(debtors)
          ..where((t) =>
              t.fullName.like(pattern) |
              t.nickname.like(pattern) |
              t.mobile.like(pattern))
          ..where((t) => t.isArchived.equals(false))
          ..limit(limit))
        .get();
  }
}
