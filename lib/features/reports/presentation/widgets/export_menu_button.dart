import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/export/report_table.dart';
import '../providers/reports_providers.dart';

class ExportMenuButton extends ConsumerWidget {
  const ExportMenuButton({required this.table, super.key});

  final ReportTable table;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exportState = ref.watch(reportExportControllerProvider);

    ref.listen(reportExportControllerProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Export failed. Please try again.')),
        );
      }
    });

    if (exportState.isLoading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return PopupMenuButton<ExportFormat>(
      icon: const Icon(Icons.ios_share_outlined),
      tooltip: 'Export',
      onSelected: (format) =>
          ref.read(reportExportControllerProvider.notifier).exportAndShare(table, format),
      itemBuilder: (context) => const [
        PopupMenuItem(value: ExportFormat.pdf, child: Text('Export as PDF')),
        PopupMenuItem(value: ExportFormat.excel, child: Text('Export as Excel')),
        PopupMenuItem(value: ExportFormat.csv, child: Text('Export as CSV')),
      ],
    );
  }
}
