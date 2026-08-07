import '../../../../core/error/result.dart';
import '../../../debtors/domain/repositories/debtor_repository.dart';
import '../../../transactions/domain/repositories/transaction_repository.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../entities/dashboard_summary.dart';

class GetDashboardSummary {
  const GetDashboardSummary(this._debtorRepository, this._transactionRepository);

  final DebtorRepository _debtorRepository;
  final TransactionRepository _transactionRepository;

  Future<Result<DashboardSummary>> call() async {
    final aggregatesResult = await _transactionRepository.calculateAggregates();
    return aggregatesResult.fold(
      (failure) => Future.value(resultFailure(failure)),
      (aggregates) => _buildSummary(aggregates),
    );
  }

  Future<Result<DashboardSummary>> _buildSummary(TransactionAggregates aggregates) async {
    final debtors = await _debtorRepository
        .watchDebtors(filter: DebtorFilter.all, sortBy: DebtorSortBy.name)
        .first;
    final balances = await _debtorRepository.watchBalancesByDebtor().first;

    final activeDebtors = debtors.where((d) => !d.isArchived).toList();
    final fullyPaid = activeDebtors.where((d) => (balances[d.id] ?? 0) <= 0).length;

    var largestBalance = 0.0;
    String? largestDebtorName;
    for (final debtor in activeDebtors) {
      final balance = balances[debtor.id] ?? 0;
      if (balance > largestBalance) {
        largestBalance = balance;
        largestDebtorName = debtor.fullName;
      }
    }

    final recentResult = await _transactionRepository
        .watchAllTransactions(limit: 5, offset: 0)
        .first;

    return resultSuccess(DashboardSummary(
      totalOutstanding: aggregates.totalOutstanding,
      totalLent: aggregates.totalLent,
      totalReceived: aggregates.totalReceived,
      totalDebtors: debtors.length,
      activeDebtors: activeDebtors.length,
      fullyPaidDebtors: fullyPaid,
      largestOutstandingBalance: largestBalance,
      largestOutstandingDebtorName: largestDebtorName,
      recentTransactions: recentResult,
    ));
  }
}
