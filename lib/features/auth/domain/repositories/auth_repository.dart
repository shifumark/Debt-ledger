import '../../../../core/error/result.dart';
import '../entities/auth_state.dart';

abstract class AuthRepository {
  Future<AuthState> getAuthState();
  Future<Result<void>> setupPin(String pin);
  Future<Result<void>> setupPassword(String password);
  Future<Result<bool>> verifyPin(String pin);
  Future<Result<bool>> verifyPassword(String password);
  Future<Result<void>> setBiometricEnabled(bool enabled);
  Future<bool> isBiometricDeviceSupported();
  Future<bool> authenticateWithBiometrics();
  Future<Duration> getAutoLockDuration();
  Future<void> setAutoLockDuration(Duration duration);
}
