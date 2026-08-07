import 'package:local_auth/local_auth.dart';

class BiometricService {
  BiometricService(this._localAuth);

  final LocalAuthentication _localAuth;

  Future<bool> isDeviceSupported() async {
    final canCheck = await _localAuth.canCheckBiometrics;
    final isSupported = await _localAuth.isDeviceSupported();
    return canCheck && isSupported;
  }

  Future<bool> authenticate({String reason = 'Unlock Debt Ledger'}) async {
    try {
      return await _localAuth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } catch (_) {
      return false;
    }
  }
}
