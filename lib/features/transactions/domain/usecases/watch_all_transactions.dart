import '../entities/debt_transaction.dart';
import '../repositories/transaction_repository.dart';

class WatchAllTransactions {
  const WatchAllTransactions(this._repository);

  final TransactionRepository _repository;

  Stream<List<DebtTransaction>> call({
    required int limit,
    required int offset,
    TransactionQueryFilter? filter,
  }) =>
      _repository.watchAllTransactions(limit: limit, offset: offset, filter: filter);
}
