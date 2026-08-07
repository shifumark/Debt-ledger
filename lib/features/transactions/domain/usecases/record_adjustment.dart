import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../../../core/utils/validators.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../entities/debt_transaction.dart';
import '../repositories/transaction_repository.dart';

class RecordAdjustment {
  const RecordAdjustment(this._repository);

  final TransactionRepository _repository;

  Future<Result<DebtTransaction>> call({
    required int debtorId,
    required double amount,
    required DateTime date,
    required AdjustmentDirection direction,
    required String reason,
  }) async {
    if (amount <= 0) {
      return resultFailure(const Failure.validation('Amount must be greater than zero'));
    }
    final reasonError = Validators.requiredReason(reason);
    if (reasonError != null) return resultFailure(Failure.validation(reasonError));

    return _repository.addTransaction(TransactionInput(
      debtorId: debtorId,
      type: TransactionType.adjustment,
      amount: amount,
      date: date,
      adjustmentDirection: direction,
      reason: reason,
    ));
  }
}
