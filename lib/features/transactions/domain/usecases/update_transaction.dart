import '../../../../core/error/result.dart';
import '../entities/debt_transaction.dart';
import '../repositories/transaction_repository.dart';

class UpdateTransaction {
  const UpdateTransaction(this._repository);

  final TransactionRepository _repository;

  Future<Result<DebtTransaction>> call(int id, TransactionInput input) =>
      _repository.updateTransaction(id, input);
}
