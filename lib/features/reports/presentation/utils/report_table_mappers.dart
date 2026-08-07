import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../data/export/report_table.dart';
import '../../domain/entities/report_entities.dart';

const _monthNames = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

ReportTable outstandingDebtsToTable(OutstandingDebtsReport report) {
  return ReportTable(
    title: 'Outstanding Debts',
    columns: const ['Debtor', 'Outstanding Balance'],
    rows: report.entries
        .map((e) => [e.debtorName, CurrencyFormatter.format(e.balance)])
        .toList(),
    summaryLines: [
      'Total outstanding: ${CurrencyFormatter.format(report.totalOutstanding)}',
      'Debtors with a balance: ${report.entries.length}',
    ],
    generatedAt: report.generatedAt,
  );
}

ReportTable paymentHistoryToTable(PaymentHistoryReport report) {
  return ReportTable(
    title: 'Payment History',
    columns: const ['Date', 'Debtor', 'Amount', 'Description'],
    rows: report.payments
        .map((e) => [
              DateFormatter.date(e.transaction.date),
              e.debtorName,
              CurrencyFormatter.format(e.transaction.amount),
              e.transaction.description ?? '',
            ])
        .toList(),
    summaryLines: [
      'Total received: ${CurrencyFormatter.format(report.totalReceived)}',
      'Payments recorded: ${report.payments.length}',
    ],
    generatedAt: report.generatedAt,
  );
}

ReportTable collectionSummaryToTable(CollectionSummaryReport report) {
  return ReportTable(
    title: 'Collection Summary',
    columns: const ['Metric', 'Value'],
    rows: [
      ['Total lent', CurrencyFormatter.format(report.totalLent)],
      ['Total received', CurrencyFormatter.format(report.totalReceived)],
      ['Total forgiven', CurrencyFormatter.format(report.totalForgiven)],
      ['Total outstanding', CurrencyFormatter.format(report.totalOutstanding)],
      ['Total debtors', '${report.totalDebtors}'],
      ['Active debtors', '${report.activeDebtors}'],
      ['Fully paid debtors', '${report.fullyPaidDebtors}'],
    ],
    generatedAt: report.generatedAt,
  );
}

ReportTable monthlyCollectionsToTable(MonthlyCollectionsReport report) {
  return ReportTable(
    title: 'Monthly Collections ${report.year}',
    columns: const ['Month', 'Collected'],
    rows: report.months
        .map((m) => [_monthNames[m.month - 1], CurrencyFormatter.format(m.total)])
        .toList(),
    summaryLines: [
      'Total for ${report.year}: ${CurrencyFormatter.format(report.totalForYear)}',
    ],
    generatedAt: report.generatedAt,
  );
}

ReportTable annualCollectionsToTable(AnnualCollectionsReport report) {
  return ReportTable(
    title: 'Annual Collections',
    columns: const ['Year', 'Collected'],
    rows: report.years.map((y) => ['${y.year}', CurrencyFormatter.format(y.total)]).toList(),
    summaryLines: [
      'Total across all years: ${CurrencyFormatter.format(report.totalAllYears)}',
    ],
    generatedAt: report.generatedAt,
  );
}
