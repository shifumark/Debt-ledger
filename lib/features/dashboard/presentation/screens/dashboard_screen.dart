import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../providers/dashboard_providers.dart';
import '../widgets/balance_chart.dart';
import '../widgets/recent_activity_list.dart';
import '../widgets/summary_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(dashboardSummaryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: AppScaffold(
        child: RefreshIndicator(
          onRefresh: () async => ref.invalidate(dashboardSummaryProvider),
          child: summaryAsync.when(
            loading: () => const LoadingIndicator(),
            error: (error, _) => ErrorView(
              message: error.toString(),
              onRetry: () => ref.invalidate(dashboardSummaryProvider),
            ),
            data: (summary) => ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: AppSpacing.sm,
                  crossAxisSpacing: AppSpacing.sm,
                  childAspectRatio: 1.1,
                  children: [
                    SummaryCard(
                      label: 'Total outstanding',
                      value: CurrencyFormatter.formatCompact(summary.totalOutstanding),
                      icon: Icons.account_balance_wallet_outlined,
                      valueColor: Theme.of(context).colorScheme.error,
                    ),
                    SummaryCard(
                      label: 'Total lent',
                      value: CurrencyFormatter.formatCompact(summary.totalLent),
                      icon: Icons.north_east,
                    ),
                    SummaryCard(
                      label: 'Total received',
                      value: CurrencyFormatter.formatCompact(summary.totalReceived),
                      icon: Icons.south_west,
                      valueColor: Theme.of(context).colorScheme.primary,
                    ),
                    SummaryCard(
                      label: 'Active debtors',
                      value: '${summary.activeDebtors}',
                      icon: Icons.people_outline,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Expanded(
                      child: SummaryCard(
                        label: 'Fully paid debtors',
                        value: '${summary.fullyPaidDebtors}',
                        icon: Icons.check_circle_outline,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: SummaryCard(
                        label: summary.largestOutstandingDebtorName ?? 'Largest balance',
                        value: CurrencyFormatter.formatCompact(summary.largestOutstandingBalance),
                        icon: Icons.trending_up,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                BalanceChart(
                  totalLent: summary.totalLent,
                  totalReceived: summary.totalReceived,
                  totalOutstanding: summary.totalOutstanding,
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Recent activity', style: Theme.of(context).textTheme.titleMedium),
                    TextButton(
                      onPressed: () => context.push(AppRoutes.transactions),
                      child: const Text('See all'),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                RecentActivityList(transactions: summary.recentTransactions),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
