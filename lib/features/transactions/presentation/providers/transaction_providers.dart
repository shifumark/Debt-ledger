import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/daos/transaction_dao.dart';
import '../../../../core/providers/core_providers.dart';
import '../../data/datasources/transaction_local_datasource.dart';
import '../../data/repositories/transaction_repository_impl.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/usecases/calculate_balance.dart';
import '../../domain/usecases/delete_transaction.dart';
import '../../domain/usecases/forgive_debt.dart';
import '../../domain/usecases/record_adjustment.dart';
import '../../domain/usecases/record_loan.dart';
import '../../domain/usecases/record_payment.dart';
import '../../domain/usecases/update_transaction.dart';
import '../../domain/usecases/watch_all_transactions.dart';
import '../../domain/usecases/watch_transactions_for_debtor.dart';

part 'transaction_providers.g.dart';

@riverpod
Future<TransactionDao> transactionDao(Ref ref) async {
  final db = await ref.watch(appDatabaseInstanceProvider.future);
  return db.transactionDao;
}

@riverpod
Future<TransactionRepository> transactionRepository(Ref ref) async {
  final dao = await ref.watch(transactionDaoProvider.future);
  return TransactionRepositoryImpl(TransactionLocalDataSourceImpl(dao));
}

@riverpod
Future<RecordLoan> recordLoanUseCase(Ref ref) async =>
    RecordLoan(await ref.watch(transactionRepositoryProvider.future));

@riverpod
Future<RecordPayment> recordPaymentUseCase(Ref ref) async =>
    RecordPayment(await ref.watch(transactionRepositoryProvider.future));

@riverpod
Future<RecordAdjustment> recordAdjustmentUseCase(Ref ref) async =>
    RecordAdjustment(await ref.watch(transactionRepositoryProvider.future));

@riverpod
Future<ForgiveDebt> forgiveDebtUseCase(Ref ref) async =>
    ForgiveDebt(await ref.watch(transactionRepositoryProvider.future));

@riverpod
Future<CalculateBalance> calculateBalanceUseCase(Ref ref) async =>
    CalculateBalance(await ref.watch(transactionRepositoryProvider.future));

@riverpod
Future<WatchTransactionsForDebtor> watchTransactionsForDebtorUseCase(Ref ref) async =>
    WatchTransactionsForDebtor(await ref.watch(transactionRepositoryProvider.future));

@riverpod
Future<WatchAllTransactions> watchAllTransactionsUseCase(Ref ref) async =>
    WatchAllTransactions(await ref.watch(transactionRepositoryProvider.future));

@riverpod
Future<UpdateTransaction> updateTransactionUseCase(Ref ref) async =>
    UpdateTransaction(await ref.watch(transactionRepositoryProvider.future));

@riverpod
Future<DeleteTransaction> deleteTransactionUseCase(Ref ref) async =>
    DeleteTransaction(await ref.watch(transactionRepositoryProvider.future));
