import 'dart:convert';
import 'dart:math';

import 'package:cryptography/cryptography.dart';

import '../constants/app_constants.dart';
import 'secure_storage_service.dart';

/// Hashes and verifies the PIN/password using Argon2id (memory-hard KDF,
/// OWASP-recommended for low-entropy secrets like a 4-6 digit PIN) and
/// tracks failed-attempt backoff. Credentials are never stored or
/// transmitted in plaintext or reversible form, and are never used to
/// derive the SQLCipher database key (see DbKeyManager) — this service only
/// gates whether the app reveals that independently-stored key.
class AuthCredentialService {
  AuthCredentialService(this._secureStorage);

  final SecureStorageService _secureStorage;

  static const int _saltLengthBytes = 16;
  static const List<int> _backoffSeconds = [30, 60, 300, 900];

  final Argon2id _argon2 = Argon2id(
    parallelism: 1,
    memory: 19456,
    iterations: 2,
    hashLength: 32,
  );

  Future<bool> hasCompletedSetup() async {
    final value = await _secureStorage.read(AppConstants.secureStorageHasCompletedSetupKey);
    return value == 'true';
  }

  Future<void> markSetupComplete() =>
      _secureStorage.write(AppConstants.secureStorageHasCompletedSetupKey, 'true');

  Future<void> setPin(String pin) => _setCredential(
        hashKey: AppConstants.secureStoragePinHashKey,
        saltKey: AppConstants.secureStoragePinSaltKey,
        secret: pin,
      );

  Future<bool> verifyPin(String pin) => _verifyCredential(
        hashKey: AppConstants.secureStoragePinHashKey,
        saltKey: AppConstants.secureStoragePinSaltKey,
        secret: pin,
      );

  Future<void> setPassword(String password) => _setCredential(
        hashKey: AppConstants.secureStoragePasswordHashKey,
        saltKey: AppConstants.secureStoragePasswordSaltKey,
        secret: password,
      );

  Future<bool> verifyPassword(String password) => _verifyCredential(
        hashKey: AppConstants.secureStoragePasswordHashKey,
        saltKey: AppConstants.secureStoragePasswordSaltKey,
        secret: password,
      );

  Future<bool> hasPassword() =>
      _secureStorage.containsKey(AppConstants.secureStoragePasswordHashKey);

  Future<void> setBiometricEnabled(bool enabled) => _secureStorage.write(
        AppConstants.secureStorageBiometricEnabledKey,
        enabled.toString(),
      );

  Future<bool> isBiometricEnabled() async {
    final value = await _secureStorage.read(AppConstants.secureStorageBiometricEnabledKey);
    return value == 'true';
  }

  Future<void> recordFailedAttempt() async {
    final current = await _failedAttemptCount();
    final next = current + 1;
    await _secureStorage.write(AppConstants.secureStorageFailedAttemptsKey, next.toString());
    if (next >= AppConstants.maxFailedAttempts) {
      final backoffIndex = min(next - AppConstants.maxFailedAttempts, _backoffSeconds.length - 1);
      final lockedUntil = DateTime.now().add(Duration(seconds: _backoffSeconds[backoffIndex]));
      await _secureStorage.write(
        AppConstants.secureStorageLockedUntilKey,
        lockedUntil.toIso8601String(),
      );
    }
  }

  Future<void> resetFailedAttempts() async {
    await _secureStorage.delete(AppConstants.secureStorageFailedAttemptsKey);
    await _secureStorage.delete(AppConstants.secureStorageLockedUntilKey);
  }

  /// Returns the remaining lockout duration, or null if not locked out.
  Future<Duration?> getRemainingLockout() async {
    final lockedUntilRaw = await _secureStorage.read(AppConstants.secureStorageLockedUntilKey);
    if (lockedUntilRaw == null) return null;
    final lockedUntil = DateTime.tryParse(lockedUntilRaw);
    if (lockedUntil == null) return null;
    final remaining = lockedUntil.difference(DateTime.now());
    return remaining.isNegative ? null : remaining;
  }

  Future<int> _failedAttemptCount() async {
    final raw = await _secureStorage.read(AppConstants.secureStorageFailedAttemptsKey);
    return int.tryParse(raw ?? '0') ?? 0;
  }

  Future<void> _setCredential({
    required String hashKey,
    required String saltKey,
    required String secret,
  }) async {
    final salt = _generateSalt();
    final hash = await _hash(secret, salt);
    await _secureStorage.write(saltKey, base64UrlEncode(salt));
    await _secureStorage.write(hashKey, base64UrlEncode(hash));
  }

  Future<bool> _verifyCredential({
    required String hashKey,
    required String saltKey,
    required String secret,
  }) async {
    final storedSaltRaw = await _secureStorage.read(saltKey);
    final storedHashRaw = await _secureStorage.read(hashKey);
    if (storedSaltRaw == null || storedHashRaw == null) return false;

    final salt = base64Url.decode(storedSaltRaw);
    final storedHash = base64Url.decode(storedHashRaw);
    final computedHash = await _hash(secret, salt);
    return _constantTimeEquals(storedHash, computedHash);
  }

  Future<List<int>> _hash(String secret, List<int> salt) async {
    final secretKey = await _argon2.deriveKeyFromPassword(
      password: secret,
      nonce: salt,
    );
    return secretKey.extractBytes();
  }

  List<int> _generateSalt() {
    final random = Random.secure();
    return List<int>.generate(_saltLengthBytes, (_) => random.nextInt(256));
  }

  bool _constantTimeEquals(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    var diff = 0;
    for (var i = 0; i < a.length; i++) {
      diff |= a[i] ^ b[i];
    }
    return diff == 0;
  }
}
