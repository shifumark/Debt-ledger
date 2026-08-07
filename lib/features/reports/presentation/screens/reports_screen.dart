import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_scaffold.dart';

class _ReportEntry {
  const _ReportEntry(this.icon, this.title, this.subtitle, this.route);

  final IconData icon;
  final String title;
  final String subtitle;
  final String route;
}

const _reports = [
  _ReportEntry(
    Icons.account_balance_wallet_outlined,
    'Outstanding Debts',
    'Who currently owes you money',
    AppRoutes.reportOutstandingDebts,
  ),
  _ReportEntry(
    Icons.receipt_long_outlined,
    'Payment History',
    'All payments received, all time',
    AppRoutes.reportPaymentHistory,
  ),
  _ReportEntry(
    Icons.summarize_outlined,
    'Collection Summary',
    'Lent, received, forgiven, and outstanding totals',
    AppRoutes.reportCollectionSummary,
  ),
  _ReportEntry(
    Icons.calendar_view_month_outlined,
    'Monthly Collections',
    'Payments collected by month',
    AppRoutes.reportMonthlyCollections,
  ),
  _ReportEntry(
    Icons.calendar_today_outlined,
    'Annual Collections',
    'Payments collected by year',
    AppRoutes.reportAnnualCollections,
  ),
];

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: AppScaffold(
        child: ListView.separated(
          padding: const EdgeInsets.all(AppSpacing.md),
          itemCount: _reports.length,
          separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
          itemBuilder: (context, index) {
            final entry = _reports[index];
            return Card(
              child: ListTile(
                leading: Icon(entry.icon),
                title: Text(entry.title),
                subtitle: Text(entry.subtitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(entry.route),
              ),
            );
          },
        ),
      ),
    );
  }
}
