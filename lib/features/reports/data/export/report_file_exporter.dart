import 'dart:io';

import 'package:csv/csv.dart';
import 'package:excel/excel.dart' as xls;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

import '../../../../core/utils/date_formatter.dart';
import 'report_table.dart';

/// Generates a PDF/Excel/CSV file for a [ReportTable] and hands it to the
/// OS share sheet — the user picks where it goes (save to Files, email,
/// upload to a cloud drive they already have installed, etc.). No direct
/// cloud API integration; see project notes on why that's out of scope.
class ReportFileExporter {
  const ReportFileExporter();

  Future<File> generateFile(ReportTable table, ExportFormat format) async {
    switch (format) {
      case ExportFormat.pdf:
        return _writePdf(table);
      case ExportFormat.excel:
        return _writeExcel(table);
      case ExportFormat.csv:
        return _writeCsv(table);
    }
  }

  Future<void> shareFile(File file, {required String subject}) {
    return Share.shareXFiles([XFile(file.path)], subject: subject);
  }

  Future<File> _writePdf(ReportTable table) async {
    final doc = pw.Document();
    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Header(
            level: 0,
            child: pw.Text(table.title, style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
          ),
          pw.Text(
            'Generated ${DateFormatter.dateTime(table.generatedAt)}',
            style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey700),
          ),
          pw.SizedBox(height: 12),
          pw.TableHelper.fromTextArray(
            headers: table.columns,
            data: table.rows,
            headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
            cellStyle: const pw.TextStyle(fontSize: 9),
            cellAlignment: pw.Alignment.centerLeft,
            headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
          ),
          if (table.summaryLines.isNotEmpty) ...[
            pw.SizedBox(height: 16),
            pw.Divider(),
            for (final line in table.summaryLines)
              pw.Text(line, style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold)),
          ],
        ],
      ),
    );
    return _saveBytes(await doc.save(), table.title, 'pdf');
  }

  Future<File> _writeExcel(ReportTable table) async {
    final workbook = xls.Excel.createExcel();
    final sheet = workbook['Report'];
    workbook.setDefaultSheet('Report');
    workbook.delete('Sheet1');

    sheet.appendRow(table.columns.map((c) => xls.TextCellValue(c)).toList());
    for (final row in table.rows) {
      sheet.appendRow(row.map((cell) => xls.TextCellValue(cell)).toList());
    }
    if (table.summaryLines.isNotEmpty) {
      sheet.appendRow([xls.TextCellValue('')]);
      for (final line in table.summaryLines) {
        sheet.appendRow([xls.TextCellValue(line)]);
      }
    }

    final bytes = workbook.encode();
    if (bytes == null) {
      throw StateError('Failed to encode Excel workbook');
    }
    return _saveBytes(bytes, table.title, 'xlsx');
  }

  Future<File> _writeCsv(ReportTable table) async {
    final rows = <List<String>>[table.columns, ...table.rows];
    if (table.summaryLines.isNotEmpty) {
      rows.add([]);
      for (final line in table.summaryLines) {
        rows.add([line]);
      }
    }
    final csv = const ListToCsvConverter().convert(rows);
    final file = await _targetFile(table.title, 'csv');
    return file.writeAsString(csv);
  }

  Future<File> _saveBytes(List<int> bytes, String title, String extension) async {
    final file = await _targetFile(title, extension);
    return file.writeAsBytes(bytes);
  }

  Future<File> _targetFile(String title, String extension) async {
    final dir = await getTemporaryDirectory();
    final safeTitle = title.replaceAll(RegExp(r'[^A-Za-z0-9 _-]'), '').replaceAll(' ', '_');
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return File(p.join(dir.path, '${safeTitle}_$timestamp.$extension'));
  }
}
