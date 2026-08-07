import '../../../../core/error/result.dart';
import '../entities/debtor.dart';
import '../repositories/debtor_repository.dart';

class GetDebtorById {
  const GetDebtorById(this._repository);

  final DebtorRepository _repository;

  Future<Result<Debtor>> call(int id) => _repository.getDebtorById(id);
}
