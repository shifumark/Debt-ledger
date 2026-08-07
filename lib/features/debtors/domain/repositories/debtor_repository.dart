import '../../../../core/error/result.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../entities/debtor.dart';

abstract class DebtorRepository {
  Future<Result<Debtor>> addDebtor(DebtorInput input);
  Future<Result<Debtor>> updateDebtor(int id, DebtorInput input);
  Future<Result<void>> setArchived(int id, {required bool archived});
  Future<Result<Debtor>> getDebtorById(int id);
  Stream<List<Debtor>> watchDebtors({
    DebtorFilter filter = DebtorFilter.active,
    DebtorSortBy sortBy = DebtorSortBy.name,
    SortOrder order = SortOrder.ascending,
  });
  Stream<Map<int, double>> watchBalancesByDebtor();
  Future<Result<List<Debtor>>> searchDebtors(String query);
}
