import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../../../core/utils/validators.dart';
import '../repositories/auth_repository.dart';

class SetupPassword {
  const SetupPassword(this._repository);

  final AuthRepository _repository;

  Future<Result<void>> call(String password) async {
    final validationError = Validators.password(password);
    if (validationError != null) {
      return resultFailure(Failure.validation(validationError));
    }
    return _repository.setupPassword(password);
  }
}
