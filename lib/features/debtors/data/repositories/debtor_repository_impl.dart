import '../../../../core/database/daos/debtor_dao.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../../../core/utils/combine_latest.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../../domain/entities/debtor.dart';
import '../../domain/repositories/debtor_repository.dart';
import '../datasources/debtor_local_datasource.dart';
import '../models/debtor_mapper.dart';

class DebtorRepositoryImpl implements DebtorRepository {
  DebtorRepositoryImpl(this._dataSource);

  final DebtorLocalDataSource _dataSource;

  @override
  Future<Result<Debtor>> addDebtor(DebtorInput input) async {
    try {
      final row = await _dataSource.insertDebtor(DebtorMapper.toInsertCompanion(input));
      return resultSuccess(DebtorMapper.toEntity(row));
    } on Exception catch (e) {
      return resultFailure(_mapException(e));
    }
  }

  @override
  Future<Result<Debtor>> updateDebtor(int id, DebtorInput input) async {
    try {
      final existing = await _dataSource.getDebtorById(id);
      final updated = await _dataSource.updateDebtor(
        id,
        DebtorMapper.toUpdateCompanion(existing, input),
      );
      return resultSuccess(DebtorMapper.toEntity(updated));
    } on Exception catch (e) {
      return resultFailure(_mapException(e));
    }
  }

  @override
  Future<Result<void>> setArchived(int id, {required bool archived}) async {
    try {
      await _dataSource.setArchived(id, archived: archived);
      return resultSuccess(null);
    } on Exception catch (e) {
      return resultFailure(_mapException(e));
    }
  }

  @override
  Future<Result<Debtor>> getDebtorById(int id) async {
    try {
      final row = await _dataSource.getDebtorById(id);
      return resultSuccess(DebtorMapper.toEntity(row));
    } on Exception catch (e) {
      return resultFailure(_mapException(e));
    }
  }

  @override
  Stream<List<Debtor>> watchDebtors({
    DebtorFilter filter = DebtorFilter.active,
    DebtorSortBy sortBy = DebtorSortBy.name,
    SortOrder order = SortOrder.ascending,
  }) {
    final includeArchived = filter != DebtorFilter.active;
    final ascending = order == SortOrder.ascending;

    final debtorStream = _dataSource
        .watchDebtors(
          includeArchived: includeArchived,
          sortField: _toSortField(sortBy),
          ascending: ascending,
        )
        .map((rows) => rows.map(DebtorMapper.toEntity).toList())
        .map((debtors) => filter == DebtorFilter.archived
            ? debtors.where((d) => d.isArchived).toList()
            : debtors);

    if (sortBy != DebtorSortBy.balance) return debtorStream;

    return combineLatest2(
      debtorStream,
      _dataSource.watchBalancesByDebtor(),
      (debtors, balances) {
        final sorted = [...debtors];
        sorted.sort((a, b) {
          final balanceA = balances[a.id] ?? 0;
          final balanceB = balances[b.id] ?? 0;
          return ascending ? balanceA.compareTo(balanceB) : balanceB.compareTo(balanceA);
        });
        return sorted;
      },
    );
  }

  @override
  Stream<Map<int, double>> watchBalancesByDebtor() => _dataSource.watchBalancesByDebtor();

  @override
  Future<Result<List<Debtor>>> searchDebtors(String query) async {
    try {
      final rows = await _dataSource.searchDebtors(query);
      return resultSuccess(rows.map(DebtorMapper.toEntity).toList());
    } on Exception catch (e) {
      return resultFailure(_mapException(e));
    }
  }

  DebtorSortField _toSortField(DebtorSortBy sortBy) {
    switch (sortBy) {
      case DebtorSortBy.name:
        return DebtorSortField.name;
      case DebtorSortBy.dateAdded:
        return DebtorSortField.dateAdded;
      case DebtorSortBy.balance:
        return DebtorSortField.balance;
      case DebtorSortBy.recentlyUpdated:
        return DebtorSortField.updatedAt;
    }
  }

  Failure _mapException(Exception e) {
    if (e is NotFoundException) return Failure.notFound(e.message);
    if (e is DatabaseException) return Failure.database(e.message);
    return Failure.unexpected(e.toString());
  }
}
