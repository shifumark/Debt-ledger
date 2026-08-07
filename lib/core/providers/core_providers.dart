import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/app_database.dart';
import '../database/connection/db_connection.dart';
import '../security/auth_credential_service.dart';
import '../security/biometric_service.dart';
import '../security/db_key_manager.dart';
import '../security/secure_storage_service.dart';

part 'core_providers.g.dart';

@Riverpod(keepAlive: true)
FlutterSecureStorage rawSecureStorage(Ref ref) => const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );

@Riverpod(keepAlive: true)
SecureStorageService secureStorage(Ref ref) =>
    SecureStorageService(ref.watch(rawSecureStorageProvider));

@Riverpod(keepAlive: true)
DbKeyManager dbKeyManager(Ref ref) => DbKeyManager(ref.watch(secureStorageProvider));

@Riverpod(keepAlive: true)
AuthCredentialService authCredentialService(Ref ref) =>
    AuthCredentialService(ref.watch(secureStorageProvider));

@Riverpod(keepAlive: true)
BiometricService biometricService(Ref ref) => BiometricService(LocalAuthentication());

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(Ref ref) => SharedPreferences.getInstance();

/// Singleton for the app's lifetime — reopening a SQLCipher connection is
/// expensive and there is exactly one on-disk database.
@Riverpod(keepAlive: true)
class AppDatabaseInstance extends _$AppDatabaseInstance {
  @override
  Future<AppDatabase> build() async {
    final keyManager = ref.watch(dbKeyManagerProvider);
    final passphrase = await keyManager.getOrCreatePassphrase();
    final db = AppDatabase(openEncryptedConnection(passphrase));
    // Guarded: the restore flow (see BackupController.confirmRestore) closes
    // the database explicitly and deliberately before this provider is
    // invalidated, so this framework-triggered close is sometimes a
    // deliberate no-op on an already-closed connection — never let it throw.
    ref.onDispose(() => db.close().catchError((_) {}));
    return db;
  }
}
