class AppConstants {
  const AppConstants._();

  static const String appName = 'Debt Ledger';
  static const String secureStorageDbPassphraseKey = 'db_passphrase_v1';
  static const String secureStoragePinHashKey = 'pin_hash_v1';
  static const String secureStoragePinSaltKey = 'pin_salt_v1';
  static const String secureStoragePasswordHashKey = 'password_hash_v1';
  static const String secureStoragePasswordSaltKey = 'password_salt_v1';
  static const String secureStorageBiometricEnabledKey = 'biometric_enabled_v1';
  static const String secureStorageFailedAttemptsKey = 'failed_attempts_v1';
  static const String secureStorageLockedUntilKey = 'locked_until_v1';
  static const String secureStorageHasCompletedSetupKey = 'has_completed_setup_v1';
  static const String secureStorageAutoLockSecondsKey = 'auto_lock_seconds_v1';

  static const String prefsThemeModeKey = 'theme_mode_v1';
  static const String prefsCurrencyCodeKey = 'currency_code_v1';

  static const int minPinLength = 4;
  static const int maxPinLength = 6;
  static const int maxFailedAttempts = 3;

  static const int defaultAutoLockSeconds = 60;

  static const int debtorListPageSize = 50;
  static const int transactionPageSize = 50;
}
