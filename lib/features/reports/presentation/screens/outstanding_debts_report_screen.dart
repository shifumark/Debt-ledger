import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../providers/reports_providers.dart';
import '../utils/report_table_mappers.dart';
import '../widgets/export_menu_button.dart';

class OutstandingDebtsReportScreen extends ConsumerWidget {
  const OutstandingDebtsReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(outstandingDebtsReportProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Outstanding Debts'),
        actions: [
          if (reportAsync.hasValue) ExportMenuButton(table: outstandingDebtsToTable(reportAsync.value!)),
        ],
      ),
      body: AppScaffold(
        child: reportAsync.when(
          loading: () => const LoadingIndicator(),
          error: (e, _) => ErrorView(
            message: e.toString(),
            onRetry: () => ref.invalidate(outstandingDebtsReportProvider),
          ),
          data: (report) {
            if (report.entries.isEmpty) {
              return const EmptyState(
                icon: Icons.account_balance_wallet_outlined,
                title: 'No outstanding debts',
                message: 'Every active debtor is fully paid up.',
              );
            }
            return ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Column(
                      children: [
                        Text('Total outstanding', style: Theme.of(context).textTheme.bodySmall),
                        Text(
                          CurrencyFormatter.format(report.totalOutstanding),
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.error,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                for (final entry in report.entries)
                  Card(
                    child: ListTile(
                      title: Text(entry.debtorName),
                      trailing: Text(
                        CurrencyFormatter.format(entry.balance),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      onTap: () => context.push('/debtors/detail/${entry.debtorId}'),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
