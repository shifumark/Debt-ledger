import '../../../../core/constants/app_constants.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../../../core/security/auth_credential_service.dart';
import '../../../../core/security/biometric_service.dart';
import '../../../../core/security/secure_storage_service.dart';
import '../../domain/entities/auth_state.dart';
import '../../domain/repositories/auth_repository.dart';

/// Implements the auth gate described in AuthCredentialService's docs: the
/// PIN/password only ever unlocks access to the independently-generated
/// SQLCipher passphrase (see DbKeyManager) — it never derives it directly.
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._credentialService,
    this._biometricService,
    this._secureStorage,
  );

  final AuthCredentialService _credentialService;
  final BiometricService _biometricService;
  final SecureStorageService _secureStorage;

  @override
  Future<AuthState> getAuthState() async {
    final hasCompletedSetup = await _credentialService.hasCompletedSetup();
    if (!hasCompletedSetup) {
      return const AuthState(status: AuthStatus.needsSetup);
    }
    final biometricEnabled = await _credentialService.isBiometricEnabled();
    final hasPassword = await _credentialService.hasPassword();
    final lockoutRemaining = await _credentialService.getRemainingLockout();
    return AuthState(
      status: AuthStatus.locked,
      biometricEnabled: biometricEnabled,
      hasPassword: hasPassword,
      lockoutRemaining: lockoutRemaining,
    );
  }

  @override
  Future<Result<void>> setupPin(String pin) async {
    await _credentialService.setPin(pin);
    await _credentialService.markSetupComplete();
    return resultSuccess(null);
  }

  @override
  Future<Result<void>> setupPassword(String password) async {
    await _credentialService.setPassword(password);
    return resultSuccess(null);
  }

  @override
  Future<Result<bool>> verifyPin(String pin) async {
    final lockout = await _credentialService.getRemainingLockout();
    if (lockout != null) {
      return resultFailure(Failure.security(
        'Too many failed attempts. Try again in ${lockout.inSeconds}s.',
      ));
    }
    final valid = await _credentialService.verifyPin(pin);
    if (valid) {
      await _credentialService.resetFailedAttempts();
    } else {
      await _credentialService.recordFailedAttempt();
    }
    return resultSuccess(valid);
  }

  @override
  Future<Result<bool>> verifyPassword(String password) async {
    final lockout = await _credentialService.getRemainingLockout();
    if (lockout != null) {
      return resultFailure(Failure.security(
        'Too many failed attempts. Try again in ${lockout.inSeconds}s.',
      ));
    }
    final valid = await _credentialService.verifyPassword(password);
    if (valid) {
      await _credentialService.resetFailedAttempts();
    } else {
      await _credentialService.recordFailedAttempt();
    }
    return resultSuccess(valid);
  }

  @override
  Future<Result<void>> setBiometricEnabled(bool enabled) async {
    await _credentialService.setBiometricEnabled(enabled);
    return resultSuccess(null);
  }

  @override
  Future<bool> isBiometricDeviceSupported() => _biometricService.isDeviceSupported();

  @override
  Future<bool> authenticateWithBiometrics() => _biometricService.authenticate();

  @override
  Future<Duration> getAutoLockDuration() async {
    final raw = await _secureStorage.read(AppConstants.secureStorageAutoLockSecondsKey);
    final seconds = int.tryParse(raw ?? '') ?? AppConstants.defaultAutoLockSeconds;
    return Duration(seconds: seconds);
  }

  @override
  Future<void> setAutoLockDuration(Duration duration) => _secureStorage.write(
        AppConstants.secureStorageAutoLockSecondsKey,
        duration.inSeconds.toString(),
      );
}
