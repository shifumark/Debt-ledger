import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../transactions/domain/entities/debt_transaction.dart';

part 'report_entities.freezed.dart';

@freezed
class OutstandingDebtEntry with _$OutstandingDebtEntry {
  const factory OutstandingDebtEntry({
    required int debtorId,
    required String debtorName,
    required double balance,
  }) = _OutstandingDebtEntry;
}

@freezed
class OutstandingDebtsReport with _$OutstandingDebtsReport {
  const factory OutstandingDebtsReport({
    required List<OutstandingDebtEntry> entries,
    required double totalOutstanding,
    required DateTime generatedAt,
  }) = _OutstandingDebtsReport;
}

@freezed
class PaymentHistoryEntry with _$PaymentHistoryEntry {
  const factory PaymentHistoryEntry({
    required DebtTransaction transaction,
    required String debtorName,
  }) = _PaymentHistoryEntry;
}

@freezed
class PaymentHistoryReport with _$PaymentHistoryReport {
  const factory PaymentHistoryReport({
    required List<PaymentHistoryEntry> payments,
    required double totalReceived,
    DateTime? startDate,
    DateTime? endDate,
    required DateTime generatedAt,
  }) = _PaymentHistoryReport;
}

@freezed
class CollectionSummaryReport with _$CollectionSummaryReport {
  const factory CollectionSummaryReport({
    required double totalLent,
    required double totalReceived,
    required double totalOutstanding,
    required double totalForgiven,
    required int totalDebtors,
    required int activeDebtors,
    required int fullyPaidDebtors,
    required DateTime generatedAt,
  }) = _CollectionSummaryReport;
}

@freezed
class MonthlyCollectionPoint with _$MonthlyCollectionPoint {
  const factory MonthlyCollectionPoint({
    /// 1-12
    required int month,
    required double total,
  }) = _MonthlyCollectionPoint;
}

@freezed
class MonthlyCollectionsReport with _$MonthlyCollectionsReport {
  const factory MonthlyCollectionsReport({
    required int year,
    required List<MonthlyCollectionPoint> months,
    required double totalForYear,
    required List<int> availableYears,
    required DateTime generatedAt,
  }) = _MonthlyCollectionsReport;
}

@freezed
class AnnualCollectionPoint with _$AnnualCollectionPoint {
  const factory AnnualCollectionPoint({
    required int year,
    required double total,
  }) = _AnnualCollectionPoint;
}

@freezed
class AnnualCollectionsReport with _$AnnualCollectionsReport {
  const factory AnnualCollectionsReport({
    required List<AnnualCollectionPoint> years,
    required double totalAllYears,
    required DateTime generatedAt,
  }) = _AnnualCollectionsReport;
}
