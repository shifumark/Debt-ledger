import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/providers/core_providers.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/auth_state.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/check_auth_status.dart';
import '../../domain/usecases/enable_biometric.dart';
import '../../domain/usecases/set_auto_lock_duration.dart';
import '../../domain/usecases/setup_password.dart';
import '../../domain/usecases/setup_pin.dart';
import '../../domain/usecases/verify_password.dart';
import '../../domain/usecases/verify_pin.dart';

part 'auth_providers.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) => AuthRepositoryImpl(
      ref.watch(authCredentialServiceProvider),
      ref.watch(biometricServiceProvider),
      ref.watch(secureStorageProvider),
    );

@riverpod
CheckAuthStatus checkAuthStatusUseCase(Ref ref) =>
    CheckAuthStatus(ref.watch(authRepositoryProvider));

@riverpod
SetupPin setupPinUseCase(Ref ref) => SetupPin(ref.watch(authRepositoryProvider));

@riverpod
SetupPassword setupPasswordUseCase(Ref ref) => SetupPassword(ref.watch(authRepositoryProvider));

@riverpod
VerifyPin verifyPinUseCase(Ref ref) => VerifyPin(ref.watch(authRepositoryProvider));

@riverpod
VerifyPassword verifyPasswordUseCase(Ref ref) =>
    VerifyPassword(ref.watch(authRepositoryProvider));

@riverpod
EnableBiometric enableBiometricUseCase(Ref ref) =>
    EnableBiometric(ref.watch(authRepositoryProvider));

@riverpod
SetAutoLockDuration setAutoLockDurationUseCase(Ref ref) =>
    SetAutoLockDuration(ref.watch(authRepositoryProvider));

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    _loadInitialState();
    return const AuthState(status: AuthStatus.locked);
  }

  Future<void> _loadInitialState() async {
    final status = await ref.read(checkAuthStatusUseCaseProvider).call();
    state = status;
  }

  Future<void> refresh() async {
    final status = await ref.read(checkAuthStatusUseCaseProvider).call();
    state = status;
  }

  Future<bool> completeSetup({
    required String pin,
    String? password,
    bool enableBiometric = false,
  }) async {
    final pinResult = await ref.read(setupPinUseCaseProvider).call(pin);
    final pinOk = pinResult.isRight();
    if (!pinOk) return false;

    if (password != null && password.isNotEmpty) {
      await ref.read(setupPasswordUseCaseProvider).call(password);
    }
    if (enableBiometric) {
      await ref.read(enableBiometricUseCaseProvider).call(enable: true);
    }
    await refresh();
    return true;
  }

  Future<bool> unlockWithPin(String pin) async {
    final result = await ref.read(verifyPinUseCaseProvider).call(pin);
    return result.fold((_) => false, (valid) {
      if (valid) state = state.copyWith(status: AuthStatus.unlocked);
      return valid;
    });
  }

  Future<bool> unlockWithPassword(String password) async {
    final result = await ref.read(verifyPasswordUseCaseProvider).call(password);
    return result.fold((_) => false, (valid) {
      if (valid) state = state.copyWith(status: AuthStatus.unlocked);
      return valid;
    });
  }

  Future<bool> unlockWithBiometrics() async {
    final repository = ref.read(authRepositoryProvider);
    final success = await repository.authenticateWithBiometrics();
    if (success) state = state.copyWith(status: AuthStatus.unlocked);
    return success;
  }

  void lock() {
    state = state.copyWith(status: AuthStatus.locked);
  }
}
