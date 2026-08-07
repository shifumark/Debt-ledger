import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../transactions/presentation/providers/transaction_providers.dart';
import '../../domain/entities/debtor.dart';
import 'debtor_providers.dart';

part 'debtor_detail_providers.g.dart';

@riverpod
Future<Debtor> debtorById(Ref ref, int debtorId) async {
  final useCase = await ref.watch(getDebtorByIdUseCaseProvider.future);
  final result = await useCase.call(debtorId);
  return result.fold((failure) => throw _FailureException(failure), (debtor) => debtor);
}

@riverpod
Stream<double> debtorBalance(Ref ref, int debtorId) async* {
  final calculateBalance = await ref.watch(calculateBalanceUseCaseProvider.future);
  yield* calculateBalance.watch(debtorId);
}

@riverpod
class DebtorArchiveController extends _$DebtorArchiveController {
  @override
  FutureOr<void> build() {}

  Future<bool> setArchived(int debtorId, {required bool archived}) async {
    state = const AsyncLoading();
    final useCase = await ref.read(archiveDebtorUseCaseProvider.future);
    final result = await useCase.call(debtorId, archived: archived);
    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (_) => const AsyncData(null),
    );
    return result.isRight();
  }
}

class _FailureException implements Exception {
  _FailureException(this.failure);
  final Failure failure;

  @override
  String toString() => failure.displayMessage;
}
