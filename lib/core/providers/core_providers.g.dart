// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rawSecureStorageHash() => r'f3728507f22f233a5f6d880e696055535072ffd1';

/// See also [rawSecureStorage].
@ProviderFor(rawSecureStorage)
final rawSecureStorageProvider = Provider<FlutterSecureStorage>.internal(
  rawSecureStorage,
  name: r'rawSecureStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rawSecureStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RawSecureStorageRef = ProviderRef<FlutterSecureStorage>;
String _$secureStorageHash() => r'b7439c195cd30a9d55a9d1020e0d24d882423153';

/// See also [secureStorage].
@ProviderFor(secureStorage)
final secureStorageProvider = Provider<SecureStorageService>.internal(
  secureStorage,
  name: r'secureStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$secureStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SecureStorageRef = ProviderRef<SecureStorageService>;
String _$dbKeyManagerHash() => r'611bdcba09d004db7a9a9eec9fab21535035f620';

/// See also [dbKeyManager].
@ProviderFor(dbKeyManager)
final dbKeyManagerProvider = Provider<DbKeyManager>.internal(
  dbKeyManager,
  name: r'dbKeyManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dbKeyManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DbKeyManagerRef = ProviderRef<DbKeyManager>;
String _$authCredentialServiceHash() =>
    r'751d2dc5da1f6531a2b19e21ffed98bd34bd51db';

/// See also [authCredentialService].
@ProviderFor(authCredentialService)
final authCredentialServiceProvider = Provider<AuthCredentialService>.internal(
  authCredentialService,
  name: r'authCredentialServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authCredentialServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthCredentialServiceRef = ProviderRef<AuthCredentialService>;
String _$biometricServiceHash() => r'0b8bb985512fb3ca73e3148f4c7e9096904779c9';

/// See also [biometricService].
@ProviderFor(biometricService)
final biometricServiceProvider = Provider<BiometricService>.internal(
  biometricService,
  name: r'biometricServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$biometricServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BiometricServiceRef = ProviderRef<BiometricService>;
String _$sharedPreferencesHash() => r'ad13470fe866595ad0f58a3e26f11048d94ef22e';

/// See also [sharedPreferences].
@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = FutureProvider<SharedPreferences>.internal(
  sharedPreferences,
  name: r'sharedPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SharedPreferencesRef = FutureProviderRef<SharedPreferences>;
String _$appDatabaseInstanceHash() =>
    r'080d0a3cdc0375ec15f5926cc671f2427f556abe';

/// Singleton for the app's lifetime — reopening a SQLCipher connection is
/// expensive and there is exactly one on-disk database.
///
/// Copied from [AppDatabaseInstance].
@ProviderFor(AppDatabaseInstance)
final appDatabaseInstanceProvider =
    AsyncNotifierProvider<AppDatabaseInstance, AppDatabase>.internal(
      AppDatabaseInstance.new,
      name: r'appDatabaseInstanceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$appDatabaseInstanceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AppDatabaseInstance = AsyncNotifier<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
