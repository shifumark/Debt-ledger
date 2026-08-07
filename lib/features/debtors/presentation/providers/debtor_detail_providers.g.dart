// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debtor_detail_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$debtorByIdHash() => r'4360282b5403c391adab367b4581b0e05188e06b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [debtorById].
@ProviderFor(debtorById)
const debtorByIdProvider = DebtorByIdFamily();

/// See also [debtorById].
class DebtorByIdFamily extends Family<AsyncValue<Debtor>> {
  /// See also [debtorById].
  const DebtorByIdFamily();

  /// See also [debtorById].
  DebtorByIdProvider call(int debtorId) {
    return DebtorByIdProvider(debtorId);
  }

  @override
  DebtorByIdProvider getProviderOverride(
    covariant DebtorByIdProvider provider,
  ) {
    return call(provider.debtorId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'debtorByIdProvider';
}

/// See also [debtorById].
class DebtorByIdProvider extends AutoDisposeFutureProvider<Debtor> {
  /// See also [debtorById].
  DebtorByIdProvider(int debtorId)
    : this._internal(
        (ref) => debtorById(ref as DebtorByIdRef, debtorId),
        from: debtorByIdProvider,
        name: r'debtorByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$debtorByIdHash,
        dependencies: DebtorByIdFamily._dependencies,
        allTransitiveDependencies: DebtorByIdFamily._allTransitiveDependencies,
        debtorId: debtorId,
      );

  DebtorByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.debtorId,
  }) : super.internal();

  final int debtorId;

  @override
  Override overrideWith(
    FutureOr<Debtor> Function(DebtorByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DebtorByIdProvider._internal(
        (ref) => create(ref as DebtorByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        debtorId: debtorId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Debtor> createElement() {
    return _DebtorByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DebtorByIdProvider && other.debtorId == debtorId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, debtorId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DebtorByIdRef on AutoDisposeFutureProviderRef<Debtor> {
  /// The parameter `debtorId` of this provider.
  int get debtorId;
}

class _DebtorByIdProviderElement
    extends AutoDisposeFutureProviderElement<Debtor>
    with DebtorByIdRef {
  _DebtorByIdProviderElement(super.provider);

  @override
  int get debtorId => (origin as DebtorByIdProvider).debtorId;
}

String _$debtorBalanceHash() => r'826f95e888cac9a4ab573a8755728964ab30bdbd';

/// See also [debtorBalance].
@ProviderFor(debtorBalance)
const debtorBalanceProvider = DebtorBalanceFamily();

/// See also [debtorBalance].
class DebtorBalanceFamily extends Family<AsyncValue<double>> {
  /// See also [debtorBalance].
  const DebtorBalanceFamily();

  /// See also [debtorBalance].
  DebtorBalanceProvider call(int debtorId) {
    return DebtorBalanceProvider(debtorId);
  }

  @override
  DebtorBalanceProvider getProviderOverride(
    covariant DebtorBalanceProvider provider,
  ) {
    return call(provider.debtorId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'debtorBalanceProvider';
}

/// See also [debtorBalance].
class DebtorBalanceProvider extends AutoDisposeStreamProvider<double> {
  /// See also [debtorBalance].
  DebtorBalanceProvider(int debtorId)
    : this._internal(
        (ref) => debtorBalance(ref as DebtorBalanceRef, debtorId),
        from: debtorBalanceProvider,
        name: r'debtorBalanceProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$debtorBalanceHash,
        dependencies: DebtorBalanceFamily._dependencies,
        allTransitiveDependencies:
            DebtorBalanceFamily._allTransitiveDependencies,
        debtorId: debtorId,
      );

  DebtorBalanceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.debtorId,
  }) : super.internal();

  final int debtorId;

  @override
  Override overrideWith(
    Stream<double> Function(DebtorBalanceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DebtorBalanceProvider._internal(
        (ref) => create(ref as DebtorBalanceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        debtorId: debtorId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<double> createElement() {
    return _DebtorBalanceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DebtorBalanceProvider && other.debtorId == debtorId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, debtorId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DebtorBalanceRef on AutoDisposeStreamProviderRef<double> {
  /// The parameter `debtorId` of this provider.
  int get debtorId;
}

class _DebtorBalanceProviderElement
    extends AutoDisposeStreamProviderElement<double>
    with DebtorBalanceRef {
  _DebtorBalanceProviderElement(super.provider);

  @override
  int get debtorId => (origin as DebtorBalanceProvider).debtorId;
}

String _$debtorArchiveControllerHash() =>
    r'8ad1599755c60d0fa8cf8f63d5aefc301c68a2e6';

/// See also [DebtorArchiveController].
@ProviderFor(DebtorArchiveController)
final debtorArchiveControllerProvider =
    AutoDisposeAsyncNotifierProvider<DebtorArchiveController, void>.internal(
      DebtorArchiveController.new,
      name: r'debtorArchiveControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$debtorArchiveControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DebtorArchiveController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
