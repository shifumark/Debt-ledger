import '../../../../core/error/result.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../../../debtors/domain/repositories/debtor_repository.dart';
import '../../../transactions/domain/repositories/transaction_repository.dart';
import '../entities/report_entities.dart';

class GenerateCollectionSummaryReport {
  const GenerateCollectionSummaryReport(this._debtorRepository, this._transactionRepository);

  final DebtorRepository _debtorRepository;
  final TransactionRepository _transactionRepository;

  Future<Result<CollectionSummaryReport>> call() async {
    final aggregatesResult = await _transactionRepository.calculateAggregates();
    return aggregatesResult.fold(
      (failure) => Future.value(resultFailure(failure)),
      (aggregates) => _withAggregates(aggregates),
    );
  }

  Future<Result<CollectionSummaryReport>> _withAggregates(
    TransactionAggregates aggregates,
  ) async {
    final forgivenResult = await _transactionRepository.calculateTotalForgiven();
    return forgivenResult.fold(
      (failure) => Future.value(resultFailure(failure)),
      (totalForgiven) => _build(aggregates, totalForgiven),
    );
  }

  Future<Result<CollectionSummaryReport>> _build(
    TransactionAggregates aggregates,
    double totalForgiven,
  ) async {
    final debtors = await _debtorRepository
        .watchDebtors(filter: DebtorFilter.all, sortBy: DebtorSortBy.name)
        .first;
    final balances = await _debtorRepository.watchBalancesByDebtor().first;

    final activeDebtors = debtors.where((d) => !d.isArchived).toList();
    final fullyPaid = activeDebtors.where((d) => (balances[d.id] ?? 0) <= 0).length;

    return resultSuccess(CollectionSummaryReport(
      totalLent: aggregates.totalLent,
      totalReceived: aggregates.totalReceived,
      totalOutstanding: aggregates.totalOutstanding,
      totalForgiven: totalForgiven,
      totalDebtors: debtors.length,
      activeDebtors: activeDebtors.length,
      fullyPaidDebtors: fullyPaid,
      generatedAt: DateTime.now(),
    ));
  }
}
