import '../../../../core/utils/combine_latest.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../../../debtors/domain/entities/debtor.dart';
import '../../../debtors/domain/repositories/debtor_repository.dart';
import '../../../transactions/domain/entities/debt_transaction.dart';
import '../../../transactions/domain/repositories/transaction_repository.dart';
import '../entities/dashboard_summary.dart';

class GetDashboardSummary {
  const GetDashboardSummary(this._debtorRepository, this._transactionRepository);

  final DebtorRepository _debtorRepository;
  final TransactionRepository _transactionRepository;

  /// Reactive — re-emits whenever any underlying debtor or transaction data
  /// changes. A one-shot Future here would go stale: the bottom-nav shell
  /// keeps the dashboard mounted even when another tab is active, so nothing
  /// would ever trigger a recompute after the first load.
  Stream<DashboardSummary> watch() {
    return combineLatest4(
      _transactionRepository.watchAggregates(),
      _debtorRepository.watchDebtors(filter: DebtorFilter.all, sortBy: DebtorSortBy.name),
      _debtorRepository.watchBalancesByDebtor(),
      _transactionRepository.watchAllTransactions(limit: 5, offset: 0),
      _build,
    );
  }

  DashboardSummary _build(
    TransactionAggregates aggregates,
    List<Debtor> debtors,
    Map<int, double> balances,
    List<DebtTransaction> recentTransactions,
  ) {
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

    return DashboardSummary(
      totalOutstanding: aggregates.totalOutstanding,
      totalLent: aggregates.totalLent,
      totalReceived: aggregates.totalReceived,
      totalDebtors: debtors.length,
      activeDebtors: activeDebtors.length,
      fullyPaidDebtors: fullyPaid,
      largestOutstandingBalance: largestBalance,
      largestOutstandingDebtorName: largestDebtorName,
      recentTransactions: recentTransactions,
    );
  }
}
