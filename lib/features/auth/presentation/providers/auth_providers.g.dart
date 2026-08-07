// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRepositoryHash() => r'cfef060c6d9384404947f74257ef63c5a36d7c7e';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = AutoDisposeProvider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRepositoryRef = AutoDisposeProviderRef<AuthRepository>;
String _$checkAuthStatusUseCaseHash() =>
    r'4bd4ba96e23e3b01fe760a9cfff5604e9a602036';

/// See also [checkAuthStatusUseCase].
@ProviderFor(checkAuthStatusUseCase)
final checkAuthStatusUseCaseProvider =
    AutoDisposeProvider<CheckAuthStatus>.internal(
      checkAuthStatusUseCase,
      name: r'checkAuthStatusUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$checkAuthStatusUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CheckAuthStatusUseCaseRef = AutoDisposeProviderRef<CheckAuthStatus>;
String _$setupPinUseCaseHash() => r'45ab3b0bf1216085fadf7b0531c91c2f92611462';

/// See also [setupPinUseCase].
@ProviderFor(setupPinUseCase)
final setupPinUseCaseProvider = AutoDisposeProvider<SetupPin>.internal(
  setupPinUseCase,
  name: r'setupPinUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$setupPinUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SetupPinUseCaseRef = AutoDisposeProviderRef<SetupPin>;
String _$setupPasswordUseCaseHash() =>
    r'ea558ddce540f79d660bda0eac99cbe2152582be';

/// See also [setupPasswordUseCase].
@ProviderFor(setupPasswordUseCase)
final setupPasswordUseCaseProvider =
    AutoDisposeProvider<SetupPassword>.internal(
      setupPasswordUseCase,
      name: r'setupPasswordUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$setupPasswordUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SetupPasswordUseCaseRef = AutoDisposeProviderRef<SetupPassword>;
String _$verifyPinUseCaseHash() => r'e841947d84531698d79c06ec98d8a3fd596cd87d';

/// See also [verifyPinUseCase].
@ProviderFor(verifyPinUseCase)
final verifyPinUseCaseProvider = AutoDisposeProvider<VerifyPin>.internal(
  verifyPinUseCase,
  name: r'verifyPinUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$verifyPinUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VerifyPinUseCaseRef = AutoDisposeProviderRef<VerifyPin>;
String _$verifyPasswordUseCaseHash() =>
    r'e0f0059455263eeeb058432e9b6804a582805d1d';

/// See also [verifyPasswordUseCase].
@ProviderFor(verifyPasswordUseCase)
final verifyPasswordUseCaseProvider =
    AutoDisposeProvider<VerifyPassword>.internal(
      verifyPasswordUseCase,
      name: r'verifyPasswordUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$verifyPasswordUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VerifyPasswordUseCaseRef = AutoDisposeProviderRef<VerifyPassword>;
String _$enableBiometricUseCaseHash() =>
    r'bd6b22dba505d903b2431b89aa2443742d54d8c2';

/// See also [enableBiometricUseCase].
@ProviderFor(enableBiometricUseCase)
final enableBiometricUseCaseProvider =
    AutoDisposeProvider<EnableBiometric>.internal(
      enableBiometricUseCase,
      name: r'enableBiometricUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$enableBiometricUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EnableBiometricUseCaseRef = AutoDisposeProviderRef<EnableBiometric>;
String _$setAutoLockDurationUseCaseHash() =>
    r'5ccd47402486c038d12145070fa0d0b0eb8affd9';

/// See also [setAutoLockDurationUseCase].
@ProviderFor(setAutoLockDurationUseCase)
final setAutoLockDurationUseCaseProvider =
    AutoDisposeProvider<SetAutoLockDuration>.internal(
      setAutoLockDurationUseCase,
      name: r'setAutoLockDurationUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$setAutoLockDurationUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SetAutoLockDurationUseCaseRef =
    AutoDisposeProviderRef<SetAutoLockDuration>;
String _$authControllerHash() => r'28df815a46c478ee1acc66f3bc50d03c06ab483c';

/// See also [AuthController].
@ProviderFor(AuthController)
final authControllerProvider =
    NotifierProvider<AuthController, AuthState>.internal(
      AuthController.new,
      name: r'authControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AuthController = Notifier<AuthState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
