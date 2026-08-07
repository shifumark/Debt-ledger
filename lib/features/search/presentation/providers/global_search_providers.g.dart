// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_search_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$globalSearchResultsHash() =>
    r'086a97a99b82555a1048aba34c8044d76a5493da';

/// See also [globalSearchResults].
@ProviderFor(globalSearchResults)
final globalSearchResultsProvider =
    AutoDisposeFutureProvider<SearchResults>.internal(
      globalSearchResults,
      name: r'globalSearchResultsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$globalSearchResultsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GlobalSearchResultsRef = AutoDisposeFutureProviderRef<SearchResults>;
String _$searchQueryHash() => r'1b2400a29b7903cdb3a47d355dd9257f12274bff';

/// See also [SearchQuery].
@ProviderFor(SearchQuery)
final searchQueryProvider =
    AutoDisposeNotifierProvider<SearchQuery, String>.internal(
      SearchQuery.new,
      name: r'searchQueryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$searchQueryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SearchQuery = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
