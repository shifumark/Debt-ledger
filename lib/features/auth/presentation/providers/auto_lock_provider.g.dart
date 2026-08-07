// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_lock_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$autoLockDurationHash() => r'f46bc13b32921ac6b99fd021b3647f0f64ecc342';

/// See also [autoLockDuration].
@ProviderFor(autoLockDuration)
final autoLockDurationProvider = AutoDisposeFutureProvider<Duration>.internal(
  autoLockDuration,
  name: r'autoLockDurationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$autoLockDurationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AutoLockDurationRef = AutoDisposeFutureProviderRef<Duration>;
String _$autoLockHash() => r'b623104d908d8fd95a7c303c14152dd5edf799f9';

/// See also [AutoLock].
@ProviderFor(AutoLock)
final autoLockProvider = NotifierProvider<AutoLock, void>.internal(
  AutoLock.new,
  name: r'autoLockProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$autoLockHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AutoLock = Notifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
