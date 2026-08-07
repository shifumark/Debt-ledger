import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../debtors/domain/entities/debtor.dart';
import '../../../debtors/presentation/providers/debtor_providers.dart';
import '../../../transactions/domain/entities/debt_transaction.dart';
import '../../../transactions/domain/repositories/transaction_repository.dart';
import '../../../transactions/presentation/providers/transaction_providers.dart';

part 'global_search_providers.g.dart';

class SearchResults {
  const SearchResults({required this.debtors, required this.transactions});

  static const empty = SearchResults(debtors: [], transactions: []);

  final List<Debtor> debtors;
  final List<DebtTransaction> transactions;

  bool get isEmpty => debtors.isEmpty && transactions.isEmpty;
}

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void setQuery(String value) => state = value;
}

@riverpod
Future<SearchResults> globalSearchResults(Ref ref) async {
  final query = ref.watch(searchQueryProvider).trim();
  if (query.isEmpty) return SearchResults.empty;

  final searchDebtors = await ref.watch(searchDebtorsUseCaseProvider.future);
  final transactionRepository = await ref.watch(transactionRepositoryProvider.future);

  final debtorsResult = await searchDebtors.call(query);
  final debtors = debtorsResult.fold((_) => <Debtor>[], (list) => list);

  final transactions = await transactionRepository
      .watchAllTransactions(limit: 50, offset: 0, filter: TransactionQueryFilter(searchTerm: query))
      .first;

  return SearchResults(debtors: debtors, transactions: transactions);
}
