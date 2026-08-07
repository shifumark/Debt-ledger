import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../repositories/auth_repository.dart';

class EnableBiometric {
  const EnableBiometric(this._repository);

  final AuthRepository _repository;

  Future<Result<void>> call({required bool enable}) async {
    if (enable) {
      final supported = await _repository.isBiometricDeviceSupported();
      if (!supported) {
        return resultFailure(
          const Failure.validation('Biometric authentication is not available on this device'),
        );
      }
      final confirmed = await _repository.authenticateWithBiometrics();
      if (!confirmed) {
        return resultFailure(const Failure.security('Biometric confirmation failed'));
      }
    }
    return _repository.setBiometricEnabled(enable);
  }
}
