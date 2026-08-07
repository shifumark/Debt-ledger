import '../entities/debt_transaction.dart';
import '../repositories/transaction_repository.dart';

class WatchTransactionsForDebtor {
  const WatchTransactionsForDebtor(this._repository);

  final TransactionRepository _repository;

  Stream<List<DebtTransaction>> call(
    int debtorId, {
    required int limit,
    required int offset,
  }) =>
      _repository.watchTransactionsForDebtor(debtorId, limit: limit, offset: offset);
}
