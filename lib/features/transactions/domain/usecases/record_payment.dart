import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../entities/debt_transaction.dart';
import '../repositories/transaction_repository.dart';

class RecordPayment {
  const RecordPayment(this._repository);

  final TransactionRepository _repository;

  Future<Result<DebtTransaction>> call({
    required int debtorId,
    required double amount,
    required DateTime date,
    String? description,
    String? attachmentPath,
  }) async {
    if (amount <= 0) {
      return resultFailure(const Failure.validation('Amount must be greater than zero'));
    }
    return _repository.addTransaction(TransactionInput(
      debtorId: debtorId,
      type: TransactionType.payment,
      amount: amount,
      date: date,
      description: description,
      attachmentPath: attachmentPath,
    ));
  }
}
