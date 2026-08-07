import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../providers/reports_providers.dart';
import '../utils/report_table_mappers.dart';
import '../widgets/export_menu_button.dart';

class AnnualCollectionsReportScreen extends ConsumerWidget {
  const AnnualCollectionsReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(annualCollectionsReportProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Annual Collections'),
        actions: [
          if (reportAsync.hasValue) ExportMenuButton(table: annualCollectionsToTable(reportAsync.value!)),
        ],
      ),
      body: AppScaffold(
        child: reportAsync.when(
          loading: () => const LoadingIndicator(),
          error: (e, _) => ErrorView(
            message: e.toString(),
            onRetry: () => ref.invalidate(annualCollectionsReportProvider),
          ),
          data: (report) {
            if (report.years.isEmpty) {
              return const EmptyState(
                icon: Icons.calendar_today_outlined,
                title: 'No collections recorded yet',
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
                        Text('Total across all years', style: Theme.of(context).textTheme.bodySmall),
                        Text(
                          CurrencyFormatter.format(report.totalAllYears),
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
                for (final entry in report.years)
                  Card(
                    child: ListTile(
                      title: Text('${entry.year}'),
                      trailing: Text(
                        CurrencyFormatter.format(entry.total),
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
