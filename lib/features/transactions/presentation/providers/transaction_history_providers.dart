import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../../domain/entities/debt_transaction.dart';
import '../../domain/repositories/transaction_repository.dart';
import 'transaction_providers.dart';

part 'transaction_history_providers.g.dart';

/// Infinite-scroll page size for a specific debtor's transaction timeline.
/// Grows [limit] rather than tracking an offset — cheap for Drift's indexed
/// `.watch()` queries and keeps the stream reactive to new transactions.
@riverpod
class DebtorTransactionPageSize extends _$DebtorTransactionPageSize {
  @override
  int build(int debtorId) => AppConstants.transactionPageSize;

  void loadMore() => state += AppConstants.transactionPageSize;
}

@riverpod
Stream<List<DebtTransaction>> debtorTransactionHistory(Ref ref, int debtorId) async* {
  final pageSize = ref.watch(debtorTransactionPageSizeProvider(debtorId));
  final useCase = await ref.watch(watchTransactionsForDebtorUseCaseProvider.future);
  yield* useCase.call(debtorId, limit: pageSize, offset: 0);
}

class GlobalTransactionFilterState {
  const GlobalTransactionFilterState({this.types, this.debtorId, this.searchTerm});

  final Set<TransactionType>? types;
  final int? debtorId;
  final String? searchTerm;

  GlobalTransactionFilterState copyWith({
    Set<TransactionType>? types,
    bool clearTypes = false,
    int? debtorId,
    bool clearDebtorId = false,
    String? searchTerm,
  }) {
    return GlobalTransactionFilterState(
      types: clearTypes ? null : (types ?? this.types),
      debtorId: clearDebtorId ? null : (debtorId ?? this.debtorId),
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}

@riverpod
class GlobalTransactionFilter extends _$GlobalTransactionFilter {
  @override
  GlobalTransactionFilterState build() => const GlobalTransactionFilterState();

  void setTypes(Set<TransactionType>? types) =>
      state = state.copyWith(types: types, clearTypes: types == null || types.isEmpty);
}

@riverpod
class GlobalTransactionPageSize extends _$GlobalTransactionPageSize {
  @override
  int build() => AppConstants.transactionPageSize;

  void loadMore() => state += AppConstants.transactionPageSize;
}

@riverpod
Stream<List<DebtTransaction>> globalTransactionHistory(Ref ref) async* {
  final pageSize = ref.watch(globalTransactionPageSizeProvider);
  final filterState = ref.watch(globalTransactionFilterProvider);
  final useCase = await ref.watch(watchAllTransactionsUseCaseProvider.future);
  yield* useCase.call(
    limit: pageSize,
    offset: 0,
    filter: TransactionQueryFilter(
      types: filterState.types,
      debtorId: filterState.debtorId,
      searchTerm: filterState.searchTerm,
    ),
  );
}
