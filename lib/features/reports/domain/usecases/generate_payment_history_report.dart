import '../../../../core/error/result.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../../../debtors/domain/repositories/debtor_repository.dart';
import '../../../transactions/domain/repositories/transaction_repository.dart';
import '../entities/report_entities.dart';

class GeneratePaymentHistoryReport {
  const GeneratePaymentHistoryReport(this._debtorRepository, this._transactionRepository);

  final DebtorRepository _debtorRepository;
  final TransactionRepository _transactionRepository;

  Future<Result<PaymentHistoryReport>> call({DateTime? startDate, DateTime? endDate}) async {
    final paymentsResult = await _transactionRepository.watchAllTransactions(
      limit: 100000,
      offset: 0,
      filter: TransactionQueryFilter(
        types: const {TransactionType.payment},
        startDate: startDate,
        endDate: endDate,
      ),
    ).first;

    final debtors = await _debtorRepository
        .watchDebtors(filter: DebtorFilter.all, sortBy: DebtorSortBy.name)
        .first;
    final namesById = {for (final d in debtors) d.id: d.fullName};

    final entries = paymentsResult
        .map((t) => PaymentHistoryEntry(
              transaction: t,
              debtorName: namesById[t.debtorId] ?? 'Unknown',
            ))
        .toList();

    final total = entries.fold<double>(0, (sum, e) => sum + e.transaction.amount);

    return resultSuccess(PaymentHistoryReport(
      payments: entries,
      totalReceived: total,
      startDate: startDate,
      endDate: endDate,
      generatedAt: DateTime.now(),
    ));
  }
}
