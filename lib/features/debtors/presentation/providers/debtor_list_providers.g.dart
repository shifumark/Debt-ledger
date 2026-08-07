// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debtor_list_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$debtorListWithBalancesHash() =>
    r'290062b8b3499e11cd2c04735e1d33f87d021494';

/// See also [debtorListWithBalances].
@ProviderFor(debtorListWithBalances)
final debtorListWithBalancesProvider =
    AutoDisposeStreamProvider<List<DebtorWithBalance>>.internal(
      debtorListWithBalances,
      name: r'debtorListWithBalancesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$debtorListWithBalancesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DebtorListWithBalancesRef =
    AutoDisposeStreamProviderRef<List<DebtorWithBalance>>;
String _$debtorListFilterHash() => r'3d709489c6914d7e94710991aa0fe2123ff6f7b4';

/// See also [DebtorListFilter].
@ProviderFor(DebtorListFilter)
final debtorListFilterProvider =
    AutoDisposeNotifierProvider<
      DebtorListFilter,
      DebtorListFilterState
    >.internal(
      DebtorListFilter.new,
      name: r'debtorListFilterProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$debtorListFilterHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DebtorListFilter = AutoDisposeNotifier<DebtorListFilterState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
