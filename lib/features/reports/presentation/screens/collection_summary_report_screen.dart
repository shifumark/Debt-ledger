import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../providers/reports_providers.dart';
import '../utils/report_table_mappers.dart';
import '../widgets/export_menu_button.dart';

class CollectionSummaryReportScreen extends ConsumerWidget {
  const CollectionSummaryReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(collectionSummaryReportProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection Summary'),
        actions: [
          if (reportAsync.hasValue) ExportMenuButton(table: collectionSummaryToTable(reportAsync.value!)),
        ],
      ),
      body: AppScaffold(
        child: reportAsync.when(
          loading: () => const LoadingIndicator(),
          error: (e, _) => ErrorView(
            message: e.toString(),
            onRetry: () => ref.invalidate(collectionSummaryReportProvider),
          ),
          data: (report) {
            final rows = <(String, String)>[
              ('Total lent', CurrencyFormatter.format(report.totalLent)),
              ('Total received', CurrencyFormatter.format(report.totalReceived)),
              ('Total forgiven', CurrencyFormatter.format(report.totalForgiven)),
              ('Total outstanding', CurrencyFormatter.format(report.totalOutstanding)),
              ('Total debtors', '${report.totalDebtors}'),
              ('Active debtors', '${report.activeDebtors}'),
              ('Fully paid debtors', '${report.fullyPaidDebtors}'),
            ];
            return ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: rows.length,
              separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, index) {
                final (label, value) = rows[index];
                return Card(
                  child: ListTile(
                    title: Text(label),
                    trailing: Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
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
