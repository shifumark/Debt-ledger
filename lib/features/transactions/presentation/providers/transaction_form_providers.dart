import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/result.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../../domain/entities/debt_transaction.dart';
import 'transaction_providers.dart';

part 'transaction_form_providers.g.dart';

@riverpod
class TransactionFormController extends _$TransactionFormController {
  @override
  FutureOr<DebtTransaction?> build() => null;

  Future<bool> submitLoan({
    required int debtorId,
    required double amount,
    required DateTime date,
    String? description,
  }) =>
      _run(() async {
        final useCase = await ref.read(recordLoanUseCaseProvider.future);
        return useCase.call(debtorId: debtorId, amount: amount, date: date, description: description);
      });

  Future<bool> submitPayment({
    required int debtorId,
    required double amount,
    required DateTime date,
    String? description,
  }) =>
      _run(() async {
        final useCase = await ref.read(recordPaymentUseCaseProvider.future);
        return useCase.call(debtorId: debtorId, amount: amount, date: date, description: description);
      });

  Future<bool> submitAdjustment({
    required int debtorId,
    required double amount,
    required DateTime date,
    required AdjustmentDirection direction,
    required String reason,
  }) =>
      _run(() async {
        final useCase = await ref.read(recordAdjustmentUseCaseProvider.future);
        return useCase.call(
          debtorId: debtorId,
          amount: amount,
          date: date,
          direction: direction,
          reason: reason,
        );
      });

  Future<bool> submitForgiveness({
    required int debtorId,
    required double amount,
    required DateTime date,
    required String reason,
  }) =>
      _run(() async {
        final useCase = await ref.read(forgiveDebtUseCaseProvider.future);
        return useCase.call(debtorId: debtorId, amount: amount, date: date, reason: reason);
      });

  Future<bool> _run(Future<Result<DebtTransaction>> Function() action) async {
    state = const AsyncLoading();
    final result = await action();
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (transaction) {
        state = AsyncData(transaction);
        return true;
      },
    );
  }
}
