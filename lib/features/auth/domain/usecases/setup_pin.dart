import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../../../core/utils/validators.dart';
import '../repositories/auth_repository.dart';

class SetupPin {
  const SetupPin(this._repository);

  final AuthRepository _repository;

  Future<Result<void>> call(String pin) async {
    final validationError = Validators.pin(pin);
    if (validationError != null) {
      return resultFailure(Failure.validation(validationError));
    }
    return _repository.setupPin(pin);
  }
}
