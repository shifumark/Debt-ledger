import '../../../../core/error/result.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../entities/debt_transaction.dart';

class TransactionQueryFilter {
  const TransactionQueryFilter({
    this.types,
    this.debtorId,
    this.searchTerm,
    this.startDate,
    this.endDate,
  });

  final Set<TransactionType>? types;
  final int? debtorId;
  final String? searchTerm;
  final DateTime? startDate;
  final DateTime? endDate;
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

class MonthlyCollection {
  const MonthlyCollection({required this.month, required this.total});

  /// 1-12
  final int month;
  final double total;
}

class AnnualCollection {
  const AnnualCollection({required this.year, required this.total});

  final int year;
  final double total;
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
  Future<Result<double>> calculateTotalForgiven();
  Future<Result<List<int>>> getAvailableReportYears();
  Future<Result<List<MonthlyCollection>>> getMonthlyCollections(int year);
  Future<Result<List<AnnualCollection>>> getAnnualCollections();
}
