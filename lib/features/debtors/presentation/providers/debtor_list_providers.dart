import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/combine_latest.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../../domain/entities/debtor.dart';
import 'debtor_providers.dart';

part 'debtor_list_providers.g.dart';

class DebtorListFilterState {
  const DebtorListFilterState({
    this.filter = DebtorFilter.active,
    this.sortBy = DebtorSortBy.name,
    this.order = SortOrder.ascending,
  });

  final DebtorFilter filter;
  final DebtorSortBy sortBy;
  final SortOrder order;

  DebtorListFilterState copyWith({
    DebtorFilter? filter,
    DebtorSortBy? sortBy,
    SortOrder? order,
  }) {
    return DebtorListFilterState(
      filter: filter ?? this.filter,
      sortBy: sortBy ?? this.sortBy,
      order: order ?? this.order,
    );
  }
}

@riverpod
class DebtorListFilter extends _$DebtorListFilter {
  @override
  DebtorListFilterState build() => const DebtorListFilterState();

  void setFilter(DebtorFilter filter) => state = state.copyWith(filter: filter);
  void setSortBy(DebtorSortBy sortBy) => state = state.copyWith(sortBy: sortBy);
  void toggleOrder() => state = state.copyWith(
        order: state.order == SortOrder.ascending ? SortOrder.descending : SortOrder.ascending,
      );
}

class DebtorWithBalance {
  const DebtorWithBalance({required this.debtor, required this.balance});

  final Debtor debtor;
  final double balance;
}

@riverpod
Stream<List<DebtorWithBalance>> debtorListWithBalances(Ref ref) async* {
  final filterState = ref.watch(debtorListFilterProvider);
  final repository = await ref.watch(debtorRepositoryProvider.future);

  final debtorsStream = repository.watchDebtors(
    filter: filterState.filter,
    sortBy: filterState.sortBy,
    order: filterState.order,
  );
  final balancesStream = repository.watchBalancesByDebtor();

  yield* combineLatest2(debtorsStream, balancesStream,
      (List<Debtor> debtors, Map<int, double> balances) {
    return debtors
        .map((d) => DebtorWithBalance(debtor: d, balance: balances[d.id] ?? 0))
        .toList();
  });
}
