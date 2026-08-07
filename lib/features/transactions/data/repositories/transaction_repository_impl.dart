import '../../../../core/database/daos/transaction_dao.dart' as db;
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/debt_transaction.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/transaction_local_datasource.dart';
import '../models/transaction_mapper.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  TransactionRepositoryImpl(this._dataSource);

  final TransactionLocalDataSource _dataSource;

  @override
  Future<Result<DebtTransaction>> addTransaction(TransactionInput input) async {
    try {
      final row =
          await _dataSource.insertTransaction(TransactionMapper.toInsertCompanion(input));
      return resultSuccess(TransactionMapper.toEntity(row));
    } on Exception catch (e) {
      return resultFailure(_mapException(e));
    }
  }

  @override
  Future<Result<DebtTransaction>> updateTransaction(int id, TransactionInput input) async {
    try {
      final existing = await _dataSource.getTransactionById(id);
      final updated = await _dataSource.updateTransaction(
        id,
        TransactionMapper.toUpdateCompanion(existing, input),
      );
      return resultSuccess(TransactionMapper.toEntity(updated));
    } on Exception catch (e) {
      return resultFailure(_mapException(e));
    }
  }

  @override
  Future<Result<void>> deleteTransaction(int id) async {
    try {
      await _dataSource.deleteTransaction(id);
      return resultSuccess(null);
    } on Exception catch (e) {
      return resultFailure(_mapException(e));
    }
  }

  @override
  Stream<List<DebtTransaction>> watchTransactionsForDebtor(
    int debtorId, {
    required int limit,
    required int offset,
  }) {
    return _dataSource
        .watchTransactionsForDebtor(debtorId, limit: limit, offset: offset)
        .map((rows) => rows.map(TransactionMapper.toEntity).toList());
  }

  @override
  Stream<List<DebtTransaction>> watchAllTransactions({
    required int limit,
    required int offset,
    TransactionQueryFilter? filter,
  }) {
    return _dataSource
        .watchAllTransactions(limit: limit, offset: offset, filter: _toDataFilter(filter))
        .map((rows) => rows.map(TransactionMapper.toEntity).toList());
  }

  @override
  Stream<double> watchBalanceForDebtor(int debtorId) =>
      _dataSource.watchBalanceForDebtor(debtorId);

  @override
  Future<Result<double>> calculateBalance(int debtorId) async {
    try {
      final balance = await _dataSource.calculateBalance(debtorId);
      return resultSuccess(balance);
    } on Exception catch (e) {
      return resultFailure(_mapException(e));
    }
  }

  @override
  Future<Result<TransactionAggregates>> calculateAggregates() async {
    try {
      final totals = await _dataSource.calculateDashboardTotals();
      return resultSuccess(TransactionAggregates(
        totalOutstanding: totals.totalOutstanding,
        totalLent: totals.totalLent,
        totalReceived: totals.totalReceived,
      ));
    } on Exception catch (e) {
      return resultFailure(_mapException(e));
    }
  }

  @override
  Future<Result<double>> calculateTotalForgiven() async {
    try {
      return resultSuccess(await _dataSource.calculateTotalForgiven());
    } on Exception catch (e) {
      return resultFailure(_mapException(e));
    }
  }

  @override
  Future<Result<List<int>>> getAvailableReportYears() async {
    try {
      return resultSuccess(await _dataSource.availableTransactionYears());
    } on Exception catch (e) {
      return resultFailure(_mapException(e));
    }
  }

  @override
  Future<Result<List<MonthlyCollection>>> getMonthlyCollections(int year) async {
    try {
      final rows = await _dataSource.monthlyCollections(year: year);
      return resultSuccess(
        rows.map((r) => MonthlyCollection(month: r.month, total: r.total)).toList(),
      );
    } on Exception catch (e) {
      return resultFailure(_mapException(e));
    }
  }

  @override
  Future<Result<List<AnnualCollection>>> getAnnualCollections() async {
    try {
      final rows = await _dataSource.annualCollections();
      return resultSuccess(
        rows.map((r) => AnnualCollection(year: r.year, total: r.total)).toList(),
      );
    } on Exception catch (e) {
      return resultFailure(_mapException(e));
    }
  }

  db.TransactionTypeFilter? _toDataFilter(TransactionQueryFilter? filter) {
    if (filter == null) return null;
    return db.TransactionTypeFilter(
      types: filter.types?.map(TransactionMapper.toColumnType).toSet(),
      debtorId: filter.debtorId,
      searchTerm: filter.searchTerm,
      startDate: filter.startDate,
      endDate: filter.endDate,
    );
  }

  Failure _mapException(Exception e) {
    if (e is NotFoundException) return Failure.notFound(e.message);
    if (e is DatabaseException) return Failure.database(e.message);
    return Failure.unexpected(e.toString());
  }
}
