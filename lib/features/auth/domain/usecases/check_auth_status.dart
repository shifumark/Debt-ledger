import '../entities/auth_state.dart';
import '../repositories/auth_repository.dart';

class CheckAuthStatus {
  const CheckAuthStatus(this._repository);

  final AuthRepository _repository;

  Future<AuthState> call() => _repository.getAuthState();
}
