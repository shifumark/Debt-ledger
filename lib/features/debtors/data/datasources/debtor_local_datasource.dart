import '../../../../core/database/app_database.dart';
import '../../../../core/database/daos/debtor_dao.dart';
import '../../../../core/error/exceptions.dart';

abstract class DebtorLocalDataSource {
  Future<DebtorRow> insertDebtor(DebtorsCompanion entry);
  Future<DebtorRow> updateDebtor(int id, DebtorsCompanion entry);
  Future<void> setArchived(int id, {required bool archived});
  Future<DebtorRow> getDebtorById(int id);
  Stream<List<DebtorRow>> watchDebtors({
    required bool includeArchived,
    required DebtorSortField sortField,
    required bool ascending,
  });
  Stream<Map<int, double>> watchBalancesByDebtor();
  Future<List<DebtorRow>> searchDebtors(String query);
}

class DebtorLocalDataSourceImpl implements DebtorLocalDataSource {
  DebtorLocalDataSourceImpl(this._dao);

  final DebtorDao _dao;

  @override
  Future<DebtorRow> insertDebtor(DebtorsCompanion entry) => _dao.insertDebtor(entry);

  @override
  Future<DebtorRow> updateDebtor(int id, DebtorsCompanion entry) async {
    final success = await _dao.updateDebtor(entry);
    if (!success) throw const DatabaseException('Failed to update debtor');
    final updated = await _dao.getDebtorById(id);
    if (updated == null) throw const NotFoundException('Debtor not found after update');
    return updated;
  }

  @override
  Future<void> setArchived(int id, {required bool archived}) async {
    final rows = await _dao.setArchived(id, archived);
    if (rows == 0) throw const NotFoundException('Debtor not found');
  }

  @override
  Future<DebtorRow> getDebtorById(int id) async {
    final row = await _dao.getDebtorById(id);
    if (row == null) throw const NotFoundException('Debtor not found');
    return row;
  }

  @override
  Stream<List<DebtorRow>> watchDebtors({
    required bool includeArchived,
    required DebtorSortField sortField,
    required bool ascending,
  }) =>
      _dao.watchDebtors(
        includeArchived: includeArchived,
        sortField: sortField,
        ascending: ascending,
      );

  @override
  Stream<Map<int, double>> watchBalancesByDebtor() => _dao.watchBalancesByDebtor();

  @override
  Future<List<DebtorRow>> searchDebtors(String query) => _dao.searchDebtors(query);
}
