import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/result.dart';
import '../../../../core/error/failures.dart';
import '../../../debtors/presentation/providers/debtor_providers.dart';
import '../../../transactions/presentation/providers/transaction_providers.dart';
import '../../data/export/report_file_exporter.dart';
import '../../data/export/report_table.dart';
import '../../domain/entities/report_entities.dart';
import '../../domain/usecases/generate_annual_collections_report.dart';
import '../../domain/usecases/generate_collection_summary_report.dart';
import '../../domain/usecases/generate_monthly_collections_report.dart';
import '../../domain/usecases/generate_outstanding_debts_report.dart';
import '../../domain/usecases/generate_payment_history_report.dart';

part 'reports_providers.g.dart';

@riverpod
Future<GenerateOutstandingDebtsReport> generateOutstandingDebtsReportUseCase(Ref ref) async =>
    GenerateOutstandingDebtsReport(await ref.watch(debtorRepositoryProvider.future));

@riverpod
Future<GeneratePaymentHistoryReport> generatePaymentHistoryReportUseCase(Ref ref) async =>
    GeneratePaymentHistoryReport(
      await ref.watch(debtorRepositoryProvider.future),
      await ref.watch(transactionRepositoryProvider.future),
    );

@riverpod
Future<GenerateCollectionSummaryReport> generateCollectionSummaryReportUseCase(Ref ref) async =>
    GenerateCollectionSummaryReport(
      await ref.watch(debtorRepositoryProvider.future),
      await ref.watch(transactionRepositoryProvider.future),
    );

@riverpod
Future<GenerateMonthlyCollectionsReport> generateMonthlyCollectionsReportUseCase(Ref ref) async =>
    GenerateMonthlyCollectionsReport(await ref.watch(transactionRepositoryProvider.future));

@riverpod
Future<GenerateAnnualCollectionsReport> generateAnnualCollectionsReportUseCase(Ref ref) async =>
    GenerateAnnualCollectionsReport(await ref.watch(transactionRepositoryProvider.future));

@riverpod
Future<OutstandingDebtsReport> outstandingDebtsReport(Ref ref) async {
  final useCase = await ref.watch(generateOutstandingDebtsReportUseCaseProvider.future);
  final result = await useCase.call();
  return _unwrap(result);
}

@riverpod
Future<PaymentHistoryReport> paymentHistoryReport(Ref ref) async {
  final useCase = await ref.watch(generatePaymentHistoryReportUseCaseProvider.future);
  final result = await useCase.call();
  return _unwrap(result);
}

@riverpod
Future<CollectionSummaryReport> collectionSummaryReport(Ref ref) async {
  final useCase = await ref.watch(generateCollectionSummaryReportUseCaseProvider.future);
  final result = await useCase.call();
  return _unwrap(result);
}

@riverpod
Future<MonthlyCollectionsReport> monthlyCollectionsReport(Ref ref, int year) async {
  final useCase = await ref.watch(generateMonthlyCollectionsReportUseCaseProvider.future);
  final result = await useCase.call(year: year);
  return _unwrap(result);
}

@riverpod
Future<AnnualCollectionsReport> annualCollectionsReport(Ref ref) async {
  final useCase = await ref.watch(generateAnnualCollectionsReportUseCaseProvider.future);
  final result = await useCase.call();
  return _unwrap(result);
}

@riverpod
ReportFileExporter reportFileExporter(Ref ref) => const ReportFileExporter();

@riverpod
class ReportExportController extends _$ReportExportController {
  @override
  FutureOr<void> build() {}

  Future<void> exportAndShare(ReportTable table, ExportFormat format) async {
    state = const AsyncLoading();
    try {
      final exporter = ref.read(reportFileExporterProvider);
      final file = await exporter.generateFile(table, format);
      await exporter.shareFile(file, subject: table.title);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

T _unwrap<T>(Result<T> result) {
  return result.fold((failure) => throw StateError(failure.displayMessage), (value) => value);
}
