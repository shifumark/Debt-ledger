import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/debtor.dart';
import 'debtor_providers.dart';

part 'debtor_form_providers.g.dart';

@riverpod
class DebtorFormController extends _$DebtorFormController {
  @override
  FutureOr<Debtor?> build() => null;

  Future<bool> submit({int? existingId, required DebtorInput input}) async {
    state = const AsyncLoading();
    final result = existingId == null
        ? await (await ref.read(addDebtorUseCaseProvider.future)).call(input)
        : await (await ref.read(updateDebtorUseCaseProvider.future)).call(existingId, input);

    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (debtor) {
        state = AsyncData(debtor);
        return true;
      },
    );
  }
}

Failure? currentFormFailure(AsyncValue<Debtor?> state) =>
    state.hasError ? state.error as Failure : null;
