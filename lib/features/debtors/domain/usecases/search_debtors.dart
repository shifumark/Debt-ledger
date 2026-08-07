import '../../../../core/error/result.dart';
import '../entities/debtor.dart';
import '../repositories/debtor_repository.dart';

class SearchDebtors {
  const SearchDebtors(this._repository);

  final DebtorRepository _repository;

  Future<Result<List<Debtor>>> call(String query) => _repository.searchDebtors(query);
}
