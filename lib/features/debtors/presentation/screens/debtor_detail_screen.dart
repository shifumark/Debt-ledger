import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/widgets/confirm_dialog.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../transactions/presentation/providers/transaction_history_providers.dart';
import '../../../transactions/presentation/widgets/timeline_date_header.dart';
import '../../../transactions/presentation/widgets/transaction_list_tile.dart';
import '../providers/debtor_detail_providers.dart';
import '../widgets/debtor_avatar.dart';

class DebtorDetailScreen extends ConsumerWidget {
  const DebtorDetailScreen({required this.debtorId, super.key});

  final int debtorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debtorAsync = ref.watch(debtorByIdProvider(debtorId));

    return Scaffold(
      body: debtorAsync.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(message: error.toString()),
        data: (debtor) {
          final balanceAsync = ref.watch(debtorBalanceProvider(debtorId));
          final transactionsAsync = ref.watch(debtorTransactionHistoryProvider(debtorId));

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () => context.push('/debtors/edit/$debtorId'),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) => _handleMenuAction(context, ref, value, debtor.isArchived),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'archive',
                        child: Text(debtor.isArchived ? 'Unarchive' : 'Archive'),
                      ),
                    ],
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    children: [
                      DebtorAvatar(fullName: debtor.fullName, photoPath: debtor.photoPath, radius: 40),
                      const SizedBox(height: AppSpacing.md),
                      Text(debtor.fullName, style: Theme.of(context).textTheme.headlineSmall),
                      if (debtor.nickname != null && debtor.nickname!.isNotEmpty)
                        Text(debtor.nickname!, style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: AppSpacing.lg),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(AppSpacing.lg),
                          child: Column(
                            children: [
                              Text('Outstanding balance', style: Theme.of(context).textTheme.bodySmall),
                              const SizedBox(height: AppSpacing.xs),
                              balanceAsync.when(
                                loading: () => const CircularProgressIndicator(),
                                error: (e, _) => Text('Error: $e'),
                                data: (balance) => Text(
                                  CurrencyFormatter.format(balance),
                                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: balance > 0
                                            ? Theme.of(context).colorScheme.error
                                            : Theme.of(context).colorScheme.primary,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Row(
                        children: [
                          Expanded(
                            child: FilledButton.icon(
                              onPressed: () =>
                                  context.push('/transaction/add?debtorId=$debtorId&type=loan'),
                              icon: const Icon(Icons.north_east),
                              label: const Text('Loan'),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: FilledButton.tonalIcon(
                              onPressed: () =>
                                  context.push('/transaction/add?debtorId=$debtorId&type=payment'),
                              icon: const Icon(Icons.south_west),
                              label: const Text('Payment'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('History', style: Theme.of(context).textTheme.titleMedium),
                      ),
                    ],
                  ),
                ),
              ),
              transactionsAsync.when(
                loading: () => const SliverToBoxAdapter(child: LoadingIndicator()),
                error: (e, _) => SliverToBoxAdapter(child: ErrorView(message: e.toString())),
                data: (transactions) {
                  if (transactions.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: EmptyState(
                        icon: Icons.receipt_long_outlined,
                        title: 'No transactions yet',
                      ),
                    );
                  }
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                    sliver: SliverList.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = transactions[index];
                        final showHeader = index == 0 ||
                            !_isSameDay(transaction.date, transactions[index - 1].date);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (showHeader) TimelineDateHeader(date: transaction.date),
                            Padding(
                              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                              child: TransactionListTile(transaction: transaction),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                  child: Center(
                    child: TextButton(
                      onPressed: () =>
                          ref.read(debtorTransactionPageSizeProvider(debtorId).notifier).loadMore(),
                      child: const Text('Load more'),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  Future<void> _handleMenuAction(
    BuildContext context,
    WidgetRef ref,
    String action,
    bool isArchived,
  ) async {
    if (action == 'archive') {
      final confirmed = await showConfirmDialog(
        context,
        title: isArchived ? 'Unarchive debtor?' : 'Archive debtor?',
        message: isArchived
            ? 'This debtor will reappear in your active list.'
            : 'This debtor will be hidden from your active list but their history is kept.',
        confirmLabel: isArchived ? 'Unarchive' : 'Archive',
      );
      if (!confirmed) return;
      await ref
          .read(debtorArchiveControllerProvider.notifier)
          .setArchived(debtorId, archived: !isArchived);
      ref.invalidate(debtorByIdProvider(debtorId));
    }
  }
}
