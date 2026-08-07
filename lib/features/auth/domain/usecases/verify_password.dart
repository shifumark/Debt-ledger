import '../../../../core/error/result.dart';
import '../repositories/auth_repository.dart';

class VerifyPassword {
  const VerifyPassword(this._repository);

  final AuthRepository _repository;

  Future<Result<bool>> call(String password) => _repository.verifyPassword(password);
}
