import '../../../../core/database/app_database.dart';
import '../../../../core/database/daos/transaction_dao.dart';
import '../../../../core/error/exceptions.dart';

abstract class TransactionLocalDataSource {
  Future<TransactionRow> insertTransaction(TransactionsCompanion entry);
  Future<TransactionRow> updateTransaction(int id, TransactionsCompanion entry);
  Future<void> deleteTransaction(int id);
  Future<TransactionRow> getTransactionById(int id);
  Stream<List<TransactionRow>> watchTransactionsForDebtor(
    int debtorId, {
    required int limit,
    required int offset,
  });
  Stream<List<TransactionRow>> watchAllTransactions({
    required int limit,
    required int offset,
    TransactionTypeFilter? filter,
  });
  Stream<double> watchBalanceForDebtor(int debtorId);
  Future<double> calculateBalance(int debtorId);
  Future<DashboardTotals> calculateDashboardTotals();
  Future<double> calculateTotalForgiven();
  Future<List<int>> availableTransactionYears();
  Future<List<MonthlyCollectionRow>> monthlyCollections({required int year});
  Future<List<AnnualCollectionRow>> annualCollections();
}

class TransactionLocalDataSourceImpl implements TransactionLocalDataSource {
  TransactionLocalDataSourceImpl(this._dao);

  final TransactionDao _dao;

  @override
  Future<TransactionRow> insertTransaction(TransactionsCompanion entry) =>
      _dao.insertTransaction(entry);

  @override
  Future<TransactionRow> updateTransaction(int id, TransactionsCompanion entry) async {
    final success = await _dao.updateTransaction(entry);
    if (!success) throw const DatabaseException('Failed to update transaction');
    final updated = await _dao.getTransactionById(id);
    if (updated == null) throw const NotFoundException('Transaction not found after update');
    return updated;
  }

  @override
  Future<void> deleteTransaction(int id) async {
    final rows = await _dao.deleteTransaction(id);
    if (rows == 0) throw const NotFoundException('Transaction not found');
  }

  @override
  Future<TransactionRow> getTransactionById(int id) async {
    final row = await _dao.getTransactionById(id);
    if (row == null) throw const NotFoundException('Transaction not found');
    return row;
  }

  @override
  Stream<List<TransactionRow>> watchTransactionsForDebtor(
    int debtorId, {
    required int limit,
    required int offset,
  }) =>
      _dao.watchTransactionsForDebtor(debtorId, limit: limit, offset: offset);

  @override
  Stream<List<TransactionRow>> watchAllTransactions({
    required int limit,
    required int offset,
    TransactionTypeFilter? filter,
  }) =>
      _dao.watchAllTransactions(limit: limit, offset: offset, filter: filter);

  @override
  Stream<double> watchBalanceForDebtor(int debtorId) => _dao.watchBalanceForDebtor(debtorId);

  @override
  Future<double> calculateBalance(int debtorId) => _dao.calculateBalance(debtorId);

  @override
  Future<DashboardTotals> calculateDashboardTotals() => _dao.calculateDashboardTotals();

  @override
  Future<double> calculateTotalForgiven() => _dao.calculateTotalForgiven();

  @override
  Future<List<int>> availableTransactionYears() => _dao.availableTransactionYears();

  @override
  Future<List<MonthlyCollectionRow>> monthlyCollections({required int year}) =>
      _dao.monthlyCollections(year: year);

  @override
  Future<List<AnnualCollectionRow>> annualCollections() => _dao.annualCollections();
}
