import 'dart:convert';
import 'dart:math';

import '../constants/app_constants.dart';
import 'secure_storage_service.dart';

/// Owns the SQLCipher database passphrase. The passphrase is a random
/// 256-bit secret independent of the user's PIN/password — it is generated
/// once on first launch and persisted only in secure (hardware-backed)
/// storage, never derived from low-entropy user input. See auth flow notes
/// in AuthCredentialService for why this separation matters.
class DbKeyManager {
  DbKeyManager(this._secureStorage);

  final SecureStorageService _secureStorage;
  static const int _keyLengthBytes = 32;

  Future<String> getOrCreatePassphrase() async {
    final existing = await _secureStorage.read(AppConstants.secureStorageDbPassphraseKey);
    if (existing != null && existing.isNotEmpty) return existing;

    final passphrase = _generatePassphrase();
    await _secureStorage.write(AppConstants.secureStorageDbPassphraseKey, passphrase);
    return passphrase;
  }

  String _generatePassphrase() {
    final random = Random.secure();
    final bytes = List<int>.generate(_keyLengthBytes, (_) => random.nextInt(256));
    return base64UrlEncode(bytes);
  }
}
