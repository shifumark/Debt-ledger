import 'package:freezed_annotation/freezed_annotation.dart';

part 'debtor.freezed.dart';

@freezed
class Debtor with _$Debtor {
  const factory Debtor({
    required int id,
    required String uuid,
    required String fullName,
    String? nickname,
    String? mobile,
    String? address,
    String? notes,
    String? photoPath,
    required DateTime dateAdded,
    required bool isArchived,
  }) = _Debtor;
}

/// Fields the user provides when creating or editing a debtor. Has no [id]
/// since one doesn't exist yet when creating.
@freezed
class DebtorInput with _$DebtorInput {
  const factory DebtorInput({
    required String fullName,
    String? nickname,
    String? mobile,
    String? address,
    String? notes,
    String? photoPath,
  }) = _DebtorInput;
}
