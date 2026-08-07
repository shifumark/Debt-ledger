import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../../../core/utils/validators.dart';
import '../entities/debtor.dart';
import '../repositories/debtor_repository.dart';

class UpdateDebtor {
  const UpdateDebtor(this._repository);

  final DebtorRepository _repository;

  Future<Result<Debtor>> call(int id, DebtorInput input) async {
    final nameError = Validators.fullName(input.fullName);
    if (nameError != null) return resultFailure(Failure.validation(nameError));
    final mobileError = Validators.mobile(input.mobile);
    if (mobileError != null) return resultFailure(Failure.validation(mobileError));
    return _repository.updateDebtor(id, input);
  }
}
