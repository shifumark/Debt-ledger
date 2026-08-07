import '../../../../core/error/result.dart';
import '../../../transactions/domain/repositories/transaction_repository.dart';
import '../entities/report_entities.dart';

class GenerateMonthlyCollectionsReport {
  const GenerateMonthlyCollectionsReport(this._transactionRepository);

  final TransactionRepository _transactionRepository;

  Future<Result<MonthlyCollectionsReport>> call({required int year}) async {
    final monthlyResult = await _transactionRepository.getMonthlyCollections(year);
    return monthlyResult.fold(
      (failure) => Future.value(resultFailure(failure)),
      (collections) => _withAvailableYears(year, collections),
    );
  }

  Future<Result<MonthlyCollectionsReport>> _withAvailableYears(
    int year,
    List<MonthlyCollection> collections,
  ) async {
    final yearsResult = await _transactionRepository.getAvailableReportYears();
    return yearsResult.fold(
      (failure) => resultFailure(failure),
      (years) => resultSuccess(_build(year, collections, years)),
    );
  }

  MonthlyCollectionsReport _build(
    int year,
    List<MonthlyCollection> collections,
    List<int> availableYears,
  ) {
    final byMonth = {for (final c in collections) c.month: c.total};
    final months = List.generate(
      12,
      (i) => MonthlyCollectionPoint(month: i + 1, total: byMonth[i + 1] ?? 0),
    );
    final total = months.fold<double>(0, (sum, m) => sum + m.total);

    return MonthlyCollectionsReport(
      year: year,
      months: months,
      totalForYear: total,
      availableYears: availableYears,
      generatedAt: DateTime.now(),
    );
  }
}
