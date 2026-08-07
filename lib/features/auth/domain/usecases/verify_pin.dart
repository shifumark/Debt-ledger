import '../../../../core/error/result.dart';
import '../repositories/auth_repository.dart';

class VerifyPin {
  const VerifyPin(this._repository);

  final AuthRepository _repository;

  Future<Result<bool>> call(String pin) => _repository.verifyPin(pin);
}
