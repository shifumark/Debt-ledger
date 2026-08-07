import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../providers/reports_providers.dart';
import '../utils/report_table_mappers.dart';
import '../widgets/export_menu_button.dart';

class PaymentHistoryReportScreen extends ConsumerWidget {
  const PaymentHistoryReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(paymentHistoryReportProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment History'),
        actions: [
          if (reportAsync.hasValue) ExportMenuButton(table: paymentHistoryToTable(reportAsync.value!)),
        ],
      ),
      body: AppScaffold(
        child: reportAsync.when(
          loading: () => const LoadingIndicator(),
          error: (e, _) => ErrorView(
            message: e.toString(),
            onRetry: () => ref.invalidate(paymentHistoryReportProvider),
          ),
          data: (report) {
            if (report.payments.isEmpty) {
              return const EmptyState(
                icon: Icons.receipt_long_outlined,
                title: 'No payments recorded yet',
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
                        Text('Total received', style: Theme.of(context).textTheme.bodySmall),
                        Text(
                          CurrencyFormatter.format(report.totalReceived),
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                for (final entry in report.payments)
                  Card(
                    child: ListTile(
                      title: Text(entry.debtorName),
                      subtitle: Text(DateFormatter.date(entry.transaction.date)),
                      trailing: Text(
                        CurrencyFormatter.format(entry.transaction.amount),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
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
