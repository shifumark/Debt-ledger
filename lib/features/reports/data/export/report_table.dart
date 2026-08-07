/// Generic tabular shape every report is converted to before export —
/// keeps the PDF/Excel/CSV generators shared across all report types
/// instead of duplicated per report.
class ReportTable {
  const ReportTable({
    required this.title,
    required this.columns,
    required this.rows,
    this.summaryLines = const [],
    required this.generatedAt,
  });

  final String title;
  final List<String> columns;
  final List<List<String>> rows;
  final List<String> summaryLines;
  final DateTime generatedAt;
}

enum ExportFormat { pdf, excel, csv }
