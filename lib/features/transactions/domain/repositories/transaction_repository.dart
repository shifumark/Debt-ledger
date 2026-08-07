import '../../../../core/error/result.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../entities/debt_transaction.dart';

class TransactionQueryFilter {
  const TransactionQueryFilter({this.types, this.debtorId, this.searchTerm});

  final Set<TransactionType>? types;
  final int? debtorId;
  final String? searchTerm;
}

class TransactionAggregates {
  const TransactionAggregates({
    required this.totalOutstanding,
    required this.totalLent,
    required this.totalReceived,
  });

  final double totalOutstanding;
  final double totalLent;
  final double totalReceived;
}

abstract class TransactionRepository {
  Future<Result<DebtTransaction>> addTransaction(TransactionInput input);
  Future<Result<DebtTransaction>> updateTransaction(int id, TransactionInput input);
  Future<Result<void>> deleteTransaction(int id);
  Stream<List<DebtTransaction>> watchTransactionsForDebtor(
    int debtorId, {
    required int limit,
    required int offset,
  });
  Stream<List<DebtTransaction>> watchAllTransactions({
    required int limit,
    required int offset,
    TransactionQueryFilter? filter,
  });
  Stream<double> watchBalanceForDebtor(int debtorId);
  Future<Result<double>> calculateBalance(int debtorId);
  Future<Result<TransactionAggregates>> calculateAggregates();
}
