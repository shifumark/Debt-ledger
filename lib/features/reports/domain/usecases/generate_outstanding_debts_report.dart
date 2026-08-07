import '../../../../core/error/result.dart';
import '../../../debtors/domain/repositories/debtor_repository.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../entities/report_entities.dart';

class GenerateOutstandingDebtsReport {
  const GenerateOutstandingDebtsReport(this._debtorRepository);

  final DebtorRepository _debtorRepository;

  Future<Result<OutstandingDebtsReport>> call() async {
    final debtors = await _debtorRepository
        .watchDebtors(filter: DebtorFilter.active, sortBy: DebtorSortBy.name)
        .first;
    final balances = await _debtorRepository.watchBalancesByDebtor().first;

    final entries = debtors
        .map((d) => OutstandingDebtEntry(
              debtorId: d.id,
              debtorName: d.fullName,
              balance: balances[d.id] ?? 0,
            ))
        .where((entry) => entry.balance > 0)
        .toList()
      ..sort((a, b) => b.balance.compareTo(a.balance));

    final total = entries.fold<double>(0, (sum, e) => sum + e.balance);

    return resultSuccess(OutstandingDebtsReport(
      entries: entries,
      totalOutstanding: total,
      generatedAt: DateTime.now(),
    ));
  }
}
