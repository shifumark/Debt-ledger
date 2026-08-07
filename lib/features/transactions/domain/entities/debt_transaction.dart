import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/enums/shared_enums.dart';

part 'debt_transaction.freezed.dart';

@freezed
class DebtTransaction with _$DebtTransaction {
  const factory DebtTransaction({
    required int id,
    required String uuid,
    required int debtorId,
    required TransactionType type,
    required double amount,
    required DateTime date,
    String? description,
    String? attachmentPath,
    AdjustmentDirection? adjustmentDirection,
    String? reason,
  }) = _DebtTransaction;
}

/// Fields required to record a new transaction of any type. Not every field
/// applies to every [TransactionType] (see per-type use cases for the exact
/// required subset).
@freezed
class TransactionInput with _$TransactionInput {
  const factory TransactionInput({
    required int debtorId,
    required TransactionType type,
    required double amount,
    required DateTime date,
    String? description,
    String? attachmentPath,
    AdjustmentDirection? adjustmentDirection,
    String? reason,
  }) = _TransactionInput;
}
