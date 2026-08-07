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

class MonthlyCollectionsReportScreen extends ConsumerStatefulWidget {
  const MonthlyCollectionsReportScreen({super.key});

  @override
  ConsumerState<MonthlyCollectionsReportScreen> createState() =>
      _MonthlyCollectionsReportScreenState();
}

class _MonthlyCollectionsReportScreenState
    extends ConsumerState<MonthlyCollectionsReportScreen> {
  late int _selectedYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    final reportAsync = ref.watch(monthlyCollectionsReportProvider(_selectedYear));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Monthly Collections'),
        actions: [
          if (reportAsync.hasValue) ExportMenuButton(table: monthlyCollectionsToTable(reportAsync.value!)),
        ],
      ),
      body: AppScaffold(
        child: reportAsync.when(
          loading: () => const LoadingIndicator(),
          error: (e, _) => ErrorView(
            message: e.toString(),
            onRetry: () => ref.invalidate(monthlyCollectionsReportProvider(_selectedYear)),
          ),
          data: (report) {
            final years = {...report.availableYears, _selectedYear}.toList()
              ..sort((a, b) => b.compareTo(a));
            return ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                DropdownButtonFormField<int>(
                  initialValue: _selectedYear,
                  decoration: const InputDecoration(labelText: 'Year'),
                  items: years
                      .map((y) => DropdownMenuItem(value: y, child: Text('$y')))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) setState(() => _selectedYear = value);
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Column(
                      children: [
                        Text('Total for $_selectedYear', style: Theme.of(context).textTheme.bodySmall),
                        Text(
                          CurrencyFormatter.format(report.totalForYear),
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
                for (final month in report.months)
                  Card(
                    child: ListTile(
                      title: Text(_monthName(month.month)),
                      trailing: Text(
                        CurrencyFormatter.format(month.total),
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

  String _monthName(int month) {
    const names = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return names[month - 1];
  }
}
