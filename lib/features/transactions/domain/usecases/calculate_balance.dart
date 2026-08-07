import '../../../../core/error/result.dart';
import '../repositories/transaction_repository.dart';

class CalculateBalance {
  const CalculateBalance(this._repository);

  final TransactionRepository _repository;

  Future<Result<double>> call(int debtorId) => _repository.calculateBalance(debtorId);

  Stream<double> watch(int debtorId) => _repository.watchBalanceForDebtor(debtorId);
}
