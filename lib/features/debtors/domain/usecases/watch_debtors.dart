import '../../../../shared/enums/shared_enums.dart';
import '../entities/debtor.dart';
import '../repositories/debtor_repository.dart';

class WatchDebtors {
  const WatchDebtors(this._repository);

  final DebtorRepository _repository;

  Stream<List<Debtor>> call({
    DebtorFilter filter = DebtorFilter.active,
    DebtorSortBy sortBy = DebtorSortBy.name,
    SortOrder order = SortOrder.ascending,
  }) =>
      _repository.watchDebtors(filter: filter, sortBy: sortBy, order: order);
}
