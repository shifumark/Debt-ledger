// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$debtorTransactionHistoryHash() =>
    r'2a40e2740abf5e7a2a71c9f093c8a4bec50128f1';

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

/// See also [debtorTransactionHistory].
@ProviderFor(debtorTransactionHistory)
const debtorTransactionHistoryProvider = DebtorTransactionHistoryFamily();

/// See also [debtorTransactionHistory].
class DebtorTransactionHistoryFamily
    extends Family<AsyncValue<List<DebtTransaction>>> {
  /// See also [debtorTransactionHistory].
  const DebtorTransactionHistoryFamily();

  /// See also [debtorTransactionHistory].
  DebtorTransactionHistoryProvider call(int debtorId) {
    return DebtorTransactionHistoryProvider(debtorId);
  }

  @override
  DebtorTransactionHistoryProvider getProviderOverride(
    covariant DebtorTransactionHistoryProvider provider,
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
  String? get name => r'debtorTransactionHistoryProvider';
}

/// See also [debtorTransactionHistory].
class DebtorTransactionHistoryProvider
    extends AutoDisposeStreamProvider<List<DebtTransaction>> {
  /// See also [debtorTransactionHistory].
  DebtorTransactionHistoryProvider(int debtorId)
    : this._internal(
        (ref) => debtorTransactionHistory(
          ref as DebtorTransactionHistoryRef,
          debtorId,
        ),
        from: debtorTransactionHistoryProvider,
        name: r'debtorTransactionHistoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$debtorTransactionHistoryHash,
        dependencies: DebtorTransactionHistoryFamily._dependencies,
        allTransitiveDependencies:
            DebtorTransactionHistoryFamily._allTransitiveDependencies,
        debtorId: debtorId,
      );

  DebtorTransactionHistoryProvider._internal(
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
    Stream<List<DebtTransaction>> Function(DebtorTransactionHistoryRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DebtorTransactionHistoryProvider._internal(
        (ref) => create(ref as DebtorTransactionHistoryRef),
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
  AutoDisposeStreamProviderElement<List<DebtTransaction>> createElement() {
    return _DebtorTransactionHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DebtorTransactionHistoryProvider &&
        other.debtorId == debtorId;
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
mixin DebtorTransactionHistoryRef
    on AutoDisposeStreamProviderRef<List<DebtTransaction>> {
  /// The parameter `debtorId` of this provider.
  int get debtorId;
}

class _DebtorTransactionHistoryProviderElement
    extends AutoDisposeStreamProviderElement<List<DebtTransaction>>
    with DebtorTransactionHistoryRef {
  _DebtorTransactionHistoryProviderElement(super.provider);

  @override
  int get debtorId => (origin as DebtorTransactionHistoryProvider).debtorId;
}

String _$globalTransactionHistoryHash() =>
    r'106196b604401fb697b0824d868fdf96829c9e7e';

/// See also [globalTransactionHistory].
@ProviderFor(globalTransactionHistory)
final globalTransactionHistoryProvider =
    AutoDisposeStreamProvider<List<DebtTransaction>>.internal(
      globalTransactionHistory,
      name: r'globalTransactionHistoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$globalTransactionHistoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GlobalTransactionHistoryRef =
    AutoDisposeStreamProviderRef<List<DebtTransaction>>;
String _$debtorTransactionPageSizeHash() =>
    r'b740561767801ee27c314bc0c86a2c55b48cd5c0';

abstract class _$DebtorTransactionPageSize
    extends BuildlessAutoDisposeNotifier<int> {
  late final int debtorId;

  int build(int debtorId);
}

/// Infinite-scroll page size for a specific debtor's transaction timeline.
/// Grows [limit] rather than tracking an offset — cheap for Drift's indexed
/// `.watch()` queries and keeps the stream reactive to new transactions.
///
/// Copied from [DebtorTransactionPageSize].
@ProviderFor(DebtorTransactionPageSize)
const debtorTransactionPageSizeProvider = DebtorTransactionPageSizeFamily();

/// Infinite-scroll page size for a specific debtor's transaction timeline.
/// Grows [limit] rather than tracking an offset — cheap for Drift's indexed
/// `.watch()` queries and keeps the stream reactive to new transactions.
///
/// Copied from [DebtorTransactionPageSize].
class DebtorTransactionPageSizeFamily extends Family<int> {
  /// Infinite-scroll page size for a specific debtor's transaction timeline.
  /// Grows [limit] rather than tracking an offset — cheap for Drift's indexed
  /// `.watch()` queries and keeps the stream reactive to new transactions.
  ///
  /// Copied from [DebtorTransactionPageSize].
  const DebtorTransactionPageSizeFamily();

  /// Infinite-scroll page size for a specific debtor's transaction timeline.
  /// Grows [limit] rather than tracking an offset — cheap for Drift's indexed
  /// `.watch()` queries and keeps the stream reactive to new transactions.
  ///
  /// Copied from [DebtorTransactionPageSize].
  DebtorTransactionPageSizeProvider call(int debtorId) {
    return DebtorTransactionPageSizeProvider(debtorId);
  }

  @override
  DebtorTransactionPageSizeProvider getProviderOverride(
    covariant DebtorTransactionPageSizeProvider provider,
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
  String? get name => r'debtorTransactionPageSizeProvider';
}

/// Infinite-scroll page size for a specific debtor's transaction timeline.
/// Grows [limit] rather than tracking an offset — cheap for Drift's indexed
/// `.watch()` queries and keeps the stream reactive to new transactions.
///
/// Copied from [DebtorTransactionPageSize].
class DebtorTransactionPageSizeProvider
    extends AutoDisposeNotifierProviderImpl<DebtorTransactionPageSize, int> {
  /// Infinite-scroll page size for a specific debtor's transaction timeline.
  /// Grows [limit] rather than tracking an offset — cheap for Drift's indexed
  /// `.watch()` queries and keeps the stream reactive to new transactions.
  ///
  /// Copied from [DebtorTransactionPageSize].
  DebtorTransactionPageSizeProvider(int debtorId)
    : this._internal(
        () => DebtorTransactionPageSize()..debtorId = debtorId,
        from: debtorTransactionPageSizeProvider,
        name: r'debtorTransactionPageSizeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$debtorTransactionPageSizeHash,
        dependencies: DebtorTransactionPageSizeFamily._dependencies,
        allTransitiveDependencies:
            DebtorTransactionPageSizeFamily._allTransitiveDependencies,
        debtorId: debtorId,
      );

  DebtorTransactionPageSizeProvider._internal(
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
  int runNotifierBuild(covariant DebtorTransactionPageSize notifier) {
    return notifier.build(debtorId);
  }

  @override
  Override overrideWith(DebtorTransactionPageSize Function() create) {
    return ProviderOverride(
      origin: this,
      override: DebtorTransactionPageSizeProvider._internal(
        () => create()..debtorId = debtorId,
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
  AutoDisposeNotifierProviderElement<DebtorTransactionPageSize, int>
  createElement() {
    return _DebtorTransactionPageSizeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DebtorTransactionPageSizeProvider &&
        other.debtorId == debtorId;
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
mixin DebtorTransactionPageSizeRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `debtorId` of this provider.
  int get debtorId;
}

class _DebtorTransactionPageSizeProviderElement
    extends AutoDisposeNotifierProviderElement<DebtorTransactionPageSize, int>
    with DebtorTransactionPageSizeRef {
  _DebtorTransactionPageSizeProviderElement(super.provider);

  @override
  int get debtorId => (origin as DebtorTransactionPageSizeProvider).debtorId;
}

String _$globalTransactionFilterHash() =>
    r'22f815c6e2626c7d92ab59917c5972980998fbd6';

/// See also [GlobalTransactionFilter].
@ProviderFor(GlobalTransactionFilter)
final globalTransactionFilterProvider =
    AutoDisposeNotifierProvider<
      GlobalTransactionFilter,
      GlobalTransactionFilterState
    >.internal(
      GlobalTransactionFilter.new,
      name: r'globalTransactionFilterProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$globalTransactionFilterHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$GlobalTransactionFilter =
    AutoDisposeNotifier<GlobalTransactionFilterState>;
String _$globalTransactionPageSizeHash() =>
    r'4b94c4fbeff74b7d9e2e5870b87213591acfe9e0';

/// See also [GlobalTransactionPageSize].
@ProviderFor(GlobalTransactionPageSize)
final globalTransactionPageSizeProvider =
    AutoDisposeNotifierProvider<GlobalTransactionPageSize, int>.internal(
      GlobalTransactionPageSize.new,
      name: r'globalTransactionPageSizeProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$globalTransactionPageSizeHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$GlobalTransactionPageSize = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
