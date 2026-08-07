// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'debt_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DebtTransaction {
  int get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  int get debtorId => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get attachmentPath => throw _privateConstructorUsedError;
  AdjustmentDirection? get adjustmentDirection =>
      throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  /// Create a copy of DebtTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DebtTransactionCopyWith<DebtTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DebtTransactionCopyWith<$Res> {
  factory $DebtTransactionCopyWith(
    DebtTransaction value,
    $Res Function(DebtTransaction) then,
  ) = _$DebtTransactionCopyWithImpl<$Res, DebtTransaction>;
  @useResult
  $Res call({
    int id,
    String uuid,
    int debtorId,
    TransactionType type,
    double amount,
    DateTime date,
    String? description,
    String? attachmentPath,
    AdjustmentDirection? adjustmentDirection,
    String? reason,
  });
}

/// @nodoc
class _$DebtTransactionCopyWithImpl<$Res, $Val extends DebtTransaction>
    implements $DebtTransactionCopyWith<$Res> {
  _$DebtTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DebtTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? debtorId = null,
    Object? type = null,
    Object? amount = null,
    Object? date = null,
    Object? description = freezed,
    Object? attachmentPath = freezed,
    Object? adjustmentDirection = freezed,
    Object? reason = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            uuid: null == uuid
                ? _value.uuid
                : uuid // ignore: cast_nullable_to_non_nullable
                      as String,
            debtorId: null == debtorId
                ? _value.debtorId
                : debtorId // ignore: cast_nullable_to_non_nullable
                      as int,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as TransactionType,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            attachmentPath: freezed == attachmentPath
                ? _value.attachmentPath
                : attachmentPath // ignore: cast_nullable_to_non_nullable
                      as String?,
            adjustmentDirection: freezed == adjustmentDirection
                ? _value.adjustmentDirection
                : adjustmentDirection // ignore: cast_nullable_to_non_nullable
                      as AdjustmentDirection?,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DebtTransactionImplCopyWith<$Res>
    implements $DebtTransactionCopyWith<$Res> {
  factory _$$DebtTransactionImplCopyWith(
    _$DebtTransactionImpl value,
    $Res Function(_$DebtTransactionImpl) then,
  ) = __$$DebtTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String uuid,
    int debtorId,
    TransactionType type,
    double amount,
    DateTime date,
    String? description,
    String? attachmentPath,
    AdjustmentDirection? adjustmentDirection,
    String? reason,
  });
}

/// @nodoc
class __$$DebtTransactionImplCopyWithImpl<$Res>
    extends _$DebtTransactionCopyWithImpl<$Res, _$DebtTransactionImpl>
    implements _$$DebtTransactionImplCopyWith<$Res> {
  __$$DebtTransactionImplCopyWithImpl(
    _$DebtTransactionImpl _value,
    $Res Function(_$DebtTransactionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DebtTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? debtorId = null,
    Object? type = null,
    Object? amount = null,
    Object? date = null,
    Object? description = freezed,
    Object? attachmentPath = freezed,
    Object? adjustmentDirection = freezed,
    Object? reason = freezed,
  }) {
    return _then(
      _$DebtTransactionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        uuid: null == uuid
            ? _value.uuid
            : uuid // ignore: cast_nullable_to_non_nullable
                  as String,
        debtorId: null == debtorId
            ? _value.debtorId
            : debtorId // ignore: cast_nullable_to_non_nullable
                  as int,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as TransactionType,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        attachmentPath: freezed == attachmentPath
            ? _value.attachmentPath
            : attachmentPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        adjustmentDirection: freezed == adjustmentDirection
            ? _value.adjustmentDirection
            : adjustmentDirection // ignore: cast_nullable_to_non_nullable
                  as AdjustmentDirection?,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DebtTransactionImpl implements _DebtTransaction {
  const _$DebtTransactionImpl({
    required this.id,
    required this.uuid,
    required this.debtorId,
    required this.type,
    required this.amount,
    required this.date,
    this.description,
    this.attachmentPath,
    this.adjustmentDirection,
    this.reason,
  });

  @override
  final int id;
  @override
  final String uuid;
  @override
  final int debtorId;
  @override
  final TransactionType type;
  @override
  final double amount;
  @override
  final DateTime date;
  @override
  final String? description;
  @override
  final String? attachmentPath;
  @override
  final AdjustmentDirection? adjustmentDirection;
  @override
  final String? reason;

  @override
  String toString() {
    return 'DebtTransaction(id: $id, uuid: $uuid, debtorId: $debtorId, type: $type, amount: $amount, date: $date, description: $description, attachmentPath: $attachmentPath, adjustmentDirection: $adjustmentDirection, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DebtTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.debtorId, debtorId) ||
                other.debtorId == debtorId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.attachmentPath, attachmentPath) ||
                other.attachmentPath == attachmentPath) &&
            (identical(other.adjustmentDirection, adjustmentDirection) ||
                other.adjustmentDirection == adjustmentDirection) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    uuid,
    debtorId,
    type,
    amount,
    date,
    description,
    attachmentPath,
    adjustmentDirection,
    reason,
  );

  /// Create a copy of DebtTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DebtTransactionImplCopyWith<_$DebtTransactionImpl> get copyWith =>
      __$$DebtTransactionImplCopyWithImpl<_$DebtTransactionImpl>(
        this,
        _$identity,
      );
}

abstract class _DebtTransaction implements DebtTransaction {
  const factory _DebtTransaction({
    required final int id,
    required final String uuid,
    required final int debtorId,
    required final TransactionType type,
    required final double amount,
    required final DateTime date,
    final String? description,
    final String? attachmentPath,
    final AdjustmentDirection? adjustmentDirection,
    final String? reason,
  }) = _$DebtTransactionImpl;

  @override
  int get id;
  @override
  String get uuid;
  @override
  int get debtorId;
  @override
  TransactionType get type;
  @override
  double get amount;
  @override
  DateTime get date;
  @override
  String? get description;
  @override
  String? get attachmentPath;
  @override
  AdjustmentDirection? get adjustmentDirection;
  @override
  String? get reason;

  /// Create a copy of DebtTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DebtTransactionImplCopyWith<_$DebtTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionInput {
  int get debtorId => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get attachmentPath => throw _privateConstructorUsedError;
  AdjustmentDirection? get adjustmentDirection =>
      throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  /// Create a copy of TransactionInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionInputCopyWith<TransactionInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionInputCopyWith<$Res> {
  factory $TransactionInputCopyWith(
    TransactionInput value,
    $Res Function(TransactionInput) then,
  ) = _$TransactionInputCopyWithImpl<$Res, TransactionInput>;
  @useResult
  $Res call({
    int debtorId,
    TransactionType type,
    double amount,
    DateTime date,
    String? description,
    String? attachmentPath,
    AdjustmentDirection? adjustmentDirection,
    String? reason,
  });
}

/// @nodoc
class _$TransactionInputCopyWithImpl<$Res, $Val extends TransactionInput>
    implements $TransactionInputCopyWith<$Res> {
  _$TransactionInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? debtorId = null,
    Object? type = null,
    Object? amount = null,
    Object? date = null,
    Object? description = freezed,
    Object? attachmentPath = freezed,
    Object? adjustmentDirection = freezed,
    Object? reason = freezed,
  }) {
    return _then(
      _value.copyWith(
            debtorId: null == debtorId
                ? _value.debtorId
                : debtorId // ignore: cast_nullable_to_non_nullable
                      as int,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as TransactionType,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            attachmentPath: freezed == attachmentPath
                ? _value.attachmentPath
                : attachmentPath // ignore: cast_nullable_to_non_nullable
                      as String?,
            adjustmentDirection: freezed == adjustmentDirection
                ? _value.adjustmentDirection
                : adjustmentDirection // ignore: cast_nullable_to_non_nullable
                      as AdjustmentDirection?,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TransactionInputImplCopyWith<$Res>
    implements $TransactionInputCopyWith<$Res> {
  factory _$$TransactionInputImplCopyWith(
    _$TransactionInputImpl value,
    $Res Function(_$TransactionInputImpl) then,
  ) = __$$TransactionInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int debtorId,
    TransactionType type,
    double amount,
    DateTime date,
    String? description,
    String? attachmentPath,
    AdjustmentDirection? adjustmentDirection,
    String? reason,
  });
}

/// @nodoc
class __$$TransactionInputImplCopyWithImpl<$Res>
    extends _$TransactionInputCopyWithImpl<$Res, _$TransactionInputImpl>
    implements _$$TransactionInputImplCopyWith<$Res> {
  __$$TransactionInputImplCopyWithImpl(
    _$TransactionInputImpl _value,
    $Res Function(_$TransactionInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TransactionInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? debtorId = null,
    Object? type = null,
    Object? amount = null,
    Object? date = null,
    Object? description = freezed,
    Object? attachmentPath = freezed,
    Object? adjustmentDirection = freezed,
    Object? reason = freezed,
  }) {
    return _then(
      _$TransactionInputImpl(
        debtorId: null == debtorId
            ? _value.debtorId
            : debtorId // ignore: cast_nullable_to_non_nullable
                  as int,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as TransactionType,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        attachmentPath: freezed == attachmentPath
            ? _value.attachmentPath
            : attachmentPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        adjustmentDirection: freezed == adjustmentDirection
            ? _value.adjustmentDirection
            : adjustmentDirection // ignore: cast_nullable_to_non_nullable
                  as AdjustmentDirection?,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$TransactionInputImpl implements _TransactionInput {
  const _$TransactionInputImpl({
    required this.debtorId,
    required this.type,
    required this.amount,
    required this.date,
    this.description,
    this.attachmentPath,
    this.adjustmentDirection,
    this.reason,
  });

  @override
  final int debtorId;
  @override
  final TransactionType type;
  @override
  final double amount;
  @override
  final DateTime date;
  @override
  final String? description;
  @override
  final String? attachmentPath;
  @override
  final AdjustmentDirection? adjustmentDirection;
  @override
  final String? reason;

  @override
  String toString() {
    return 'TransactionInput(debtorId: $debtorId, type: $type, amount: $amount, date: $date, description: $description, attachmentPath: $attachmentPath, adjustmentDirection: $adjustmentDirection, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionInputImpl &&
            (identical(other.debtorId, debtorId) ||
                other.debtorId == debtorId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.attachmentPath, attachmentPath) ||
                other.attachmentPath == attachmentPath) &&
            (identical(other.adjustmentDirection, adjustmentDirection) ||
                other.adjustmentDirection == adjustmentDirection) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    debtorId,
    type,
    amount,
    date,
    description,
    attachmentPath,
    adjustmentDirection,
    reason,
  );

  /// Create a copy of TransactionInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionInputImplCopyWith<_$TransactionInputImpl> get copyWith =>
      __$$TransactionInputImplCopyWithImpl<_$TransactionInputImpl>(
        this,
        _$identity,
      );
}

abstract class _TransactionInput implements TransactionInput {
  const factory _TransactionInput({
    required final int debtorId,
    required final TransactionType type,
    required final double amount,
    required final DateTime date,
    final String? description,
    final String? attachmentPath,
    final AdjustmentDirection? adjustmentDirection,
    final String? reason,
  }) = _$TransactionInputImpl;

  @override
  int get debtorId;
  @override
  TransactionType get type;
  @override
  double get amount;
  @override
  DateTime get date;
  @override
  String? get description;
  @override
  String? get attachmentPath;
  @override
  AdjustmentDirection? get adjustmentDirection;
  @override
  String? get reason;

  /// Create a copy of TransactionInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionInputImplCopyWith<_$TransactionInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
