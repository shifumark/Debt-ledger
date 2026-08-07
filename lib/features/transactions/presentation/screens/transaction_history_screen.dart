import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../debtors/presentation/providers/debtor_list_providers.dart';
import '../providers/transaction_history_providers.dart';
import '../widgets/transaction_filter_sheet.dart';
import '../widgets/transaction_list_tile.dart';

class TransactionHistoryScreen extends ConsumerWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(globalTransactionHistoryProvider);
    final debtorsAsync = ref.watch(debtorListWithBalancesProvider);
    final debtorNames = {
      for (final item in debtorsAsync.valueOrNull ?? []) item.debtor.id: item.debtor.fullName,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => showTransactionFilterSheet(context),
          ),
        ],
      ),
      body: AppScaffold(
        child: transactionsAsync.when(
          loading: () => const LoadingIndicator(),
          error: (error, _) => ErrorView(
            message: error.toString(),
            onRetry: () => ref.invalidate(globalTransactionHistoryProvider),
          ),
          data: (transactions) {
            if (transactions.isEmpty) {
              return const EmptyState(
                icon: Icons.receipt_long_outlined,
                title: 'No transactions yet',
                message: 'Loans, payments, and adjustments will appear here.',
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: transactions.length + 1,
              itemBuilder: (context, index) {
                if (index == transactions.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                    child: Center(
                      child: TextButton(
                        onPressed: () =>
                            ref.read(globalTransactionPageSizeProvider.notifier).loadMore(),
                        child: const Text('Load more'),
                      ),
                    ),
                  );
                }
                final transaction = transactions[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: TransactionListTile(
                    transaction: transaction,
                    debtorName: debtorNames[transaction.debtorId],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
