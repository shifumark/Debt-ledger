import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../transactions/presentation/widgets/transaction_list_tile.dart';
import '../providers/global_search_providers.dart';
import '../widgets/search_result_tile.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resultsAsync = ref.watch(globalSearchResultsProvider);
    final hasQuery = ref.watch(searchQueryProvider).trim().isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search debtors or transactions',
            border: InputBorder.none,
          ),
          onChanged: (value) => ref.read(searchQueryProvider.notifier).setQuery(value),
        ),
      ),
      body: !hasQuery
          ? const EmptyState(icon: Icons.search, title: 'Search your ledger')
          : resultsAsync.when(
              loading: () => const LoadingIndicator(),
              error: (e, _) => ErrorView(message: e.toString()),
              data: (results) {
                if (results.isEmpty) {
                  return const EmptyState(icon: Icons.search_off, title: 'No results found');
                }
                return ListView(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  children: [
                    if (results.debtors.isNotEmpty) ...[
                      Text('Debtors', style: Theme.of(context).textTheme.titleSmall),
                      ...results.debtors.map((d) => DebtorSearchResultTile(
                            debtor: d,
                            onTap: () => context.push('/debtors/detail/${d.id}'),
                          )),
                      const SizedBox(height: AppSpacing.md),
                    ],
                    if (results.transactions.isNotEmpty) ...[
                      Text('Transactions', style: Theme.of(context).textTheme.titleSmall),
                      ...results.transactions.map((t) => TransactionListTile(transaction: t)),
                    ],
                  ],
                );
              },
            ),
    );
  }
}
