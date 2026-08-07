// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OutstandingDebtEntry {
  int get debtorId => throw _privateConstructorUsedError;
  String get debtorName => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;

  /// Create a copy of OutstandingDebtEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutstandingDebtEntryCopyWith<OutstandingDebtEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutstandingDebtEntryCopyWith<$Res> {
  factory $OutstandingDebtEntryCopyWith(
    OutstandingDebtEntry value,
    $Res Function(OutstandingDebtEntry) then,
  ) = _$OutstandingDebtEntryCopyWithImpl<$Res, OutstandingDebtEntry>;
  @useResult
  $Res call({int debtorId, String debtorName, double balance});
}

/// @nodoc
class _$OutstandingDebtEntryCopyWithImpl<
  $Res,
  $Val extends OutstandingDebtEntry
>
    implements $OutstandingDebtEntryCopyWith<$Res> {
  _$OutstandingDebtEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutstandingDebtEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? debtorId = null,
    Object? debtorName = null,
    Object? balance = null,
  }) {
    return _then(
      _value.copyWith(
            debtorId: null == debtorId
                ? _value.debtorId
                : debtorId // ignore: cast_nullable_to_non_nullable
                      as int,
            debtorName: null == debtorName
                ? _value.debtorName
                : debtorName // ignore: cast_nullable_to_non_nullable
                      as String,
            balance: null == balance
                ? _value.balance
                : balance // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OutstandingDebtEntryImplCopyWith<$Res>
    implements $OutstandingDebtEntryCopyWith<$Res> {
  factory _$$OutstandingDebtEntryImplCopyWith(
    _$OutstandingDebtEntryImpl value,
    $Res Function(_$OutstandingDebtEntryImpl) then,
  ) = __$$OutstandingDebtEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int debtorId, String debtorName, double balance});
}

/// @nodoc
class __$$OutstandingDebtEntryImplCopyWithImpl<$Res>
    extends _$OutstandingDebtEntryCopyWithImpl<$Res, _$OutstandingDebtEntryImpl>
    implements _$$OutstandingDebtEntryImplCopyWith<$Res> {
  __$$OutstandingDebtEntryImplCopyWithImpl(
    _$OutstandingDebtEntryImpl _value,
    $Res Function(_$OutstandingDebtEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OutstandingDebtEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? debtorId = null,
    Object? debtorName = null,
    Object? balance = null,
  }) {
    return _then(
      _$OutstandingDebtEntryImpl(
        debtorId: null == debtorId
            ? _value.debtorId
            : debtorId // ignore: cast_nullable_to_non_nullable
                  as int,
        debtorName: null == debtorName
            ? _value.debtorName
            : debtorName // ignore: cast_nullable_to_non_nullable
                  as String,
        balance: null == balance
            ? _value.balance
            : balance // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$OutstandingDebtEntryImpl implements _OutstandingDebtEntry {
  const _$OutstandingDebtEntryImpl({
    required this.debtorId,
    required this.debtorName,
    required this.balance,
  });

  @override
  final int debtorId;
  @override
  final String debtorName;
  @override
  final double balance;

  @override
  String toString() {
    return 'OutstandingDebtEntry(debtorId: $debtorId, debtorName: $debtorName, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutstandingDebtEntryImpl &&
            (identical(other.debtorId, debtorId) ||
                other.debtorId == debtorId) &&
            (identical(other.debtorName, debtorName) ||
                other.debtorName == debtorName) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, debtorId, debtorName, balance);

  /// Create a copy of OutstandingDebtEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutstandingDebtEntryImplCopyWith<_$OutstandingDebtEntryImpl>
  get copyWith =>
      __$$OutstandingDebtEntryImplCopyWithImpl<_$OutstandingDebtEntryImpl>(
        this,
        _$identity,
      );
}

abstract class _OutstandingDebtEntry implements OutstandingDebtEntry {
  const factory _OutstandingDebtEntry({
    required final int debtorId,
    required final String debtorName,
    required final double balance,
  }) = _$OutstandingDebtEntryImpl;

  @override
  int get debtorId;
  @override
  String get debtorName;
  @override
  double get balance;

  /// Create a copy of OutstandingDebtEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutstandingDebtEntryImplCopyWith<_$OutstandingDebtEntryImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OutstandingDebtsReport {
  List<OutstandingDebtEntry> get entries => throw _privateConstructorUsedError;
  double get totalOutstanding => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;

  /// Create a copy of OutstandingDebtsReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutstandingDebtsReportCopyWith<OutstandingDebtsReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutstandingDebtsReportCopyWith<$Res> {
  factory $OutstandingDebtsReportCopyWith(
    OutstandingDebtsReport value,
    $Res Function(OutstandingDebtsReport) then,
  ) = _$OutstandingDebtsReportCopyWithImpl<$Res, OutstandingDebtsReport>;
  @useResult
  $Res call({
    List<OutstandingDebtEntry> entries,
    double totalOutstanding,
    DateTime generatedAt,
  });
}

/// @nodoc
class _$OutstandingDebtsReportCopyWithImpl<
  $Res,
  $Val extends OutstandingDebtsReport
>
    implements $OutstandingDebtsReportCopyWith<$Res> {
  _$OutstandingDebtsReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutstandingDebtsReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = null,
    Object? totalOutstanding = null,
    Object? generatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            entries: null == entries
                ? _value.entries
                : entries // ignore: cast_nullable_to_non_nullable
                      as List<OutstandingDebtEntry>,
            totalOutstanding: null == totalOutstanding
                ? _value.totalOutstanding
                : totalOutstanding // ignore: cast_nullable_to_non_nullable
                      as double,
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OutstandingDebtsReportImplCopyWith<$Res>
    implements $OutstandingDebtsReportCopyWith<$Res> {
  factory _$$OutstandingDebtsReportImplCopyWith(
    _$OutstandingDebtsReportImpl value,
    $Res Function(_$OutstandingDebtsReportImpl) then,
  ) = __$$OutstandingDebtsReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<OutstandingDebtEntry> entries,
    double totalOutstanding,
    DateTime generatedAt,
  });
}

/// @nodoc
class __$$OutstandingDebtsReportImplCopyWithImpl<$Res>
    extends
        _$OutstandingDebtsReportCopyWithImpl<$Res, _$OutstandingDebtsReportImpl>
    implements _$$OutstandingDebtsReportImplCopyWith<$Res> {
  __$$OutstandingDebtsReportImplCopyWithImpl(
    _$OutstandingDebtsReportImpl _value,
    $Res Function(_$OutstandingDebtsReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OutstandingDebtsReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = null,
    Object? totalOutstanding = null,
    Object? generatedAt = null,
  }) {
    return _then(
      _$OutstandingDebtsReportImpl(
        entries: null == entries
            ? _value._entries
            : entries // ignore: cast_nullable_to_non_nullable
                  as List<OutstandingDebtEntry>,
        totalOutstanding: null == totalOutstanding
            ? _value.totalOutstanding
            : totalOutstanding // ignore: cast_nullable_to_non_nullable
                  as double,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$OutstandingDebtsReportImpl implements _OutstandingDebtsReport {
  const _$OutstandingDebtsReportImpl({
    required final List<OutstandingDebtEntry> entries,
    required this.totalOutstanding,
    required this.generatedAt,
  }) : _entries = entries;

  final List<OutstandingDebtEntry> _entries;
  @override
  List<OutstandingDebtEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  final double totalOutstanding;
  @override
  final DateTime generatedAt;

  @override
  String toString() {
    return 'OutstandingDebtsReport(entries: $entries, totalOutstanding: $totalOutstanding, generatedAt: $generatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutstandingDebtsReportImpl &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            (identical(other.totalOutstanding, totalOutstanding) ||
                other.totalOutstanding == totalOutstanding) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_entries),
    totalOutstanding,
    generatedAt,
  );

  /// Create a copy of OutstandingDebtsReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutstandingDebtsReportImplCopyWith<_$OutstandingDebtsReportImpl>
  get copyWith =>
      __$$OutstandingDebtsReportImplCopyWithImpl<_$OutstandingDebtsReportImpl>(
        this,
        _$identity,
      );
}

abstract class _OutstandingDebtsReport implements OutstandingDebtsReport {
  const factory _OutstandingDebtsReport({
    required final List<OutstandingDebtEntry> entries,
    required final double totalOutstanding,
    required final DateTime generatedAt,
  }) = _$OutstandingDebtsReportImpl;

  @override
  List<OutstandingDebtEntry> get entries;
  @override
  double get totalOutstanding;
  @override
  DateTime get generatedAt;

  /// Create a copy of OutstandingDebtsReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutstandingDebtsReportImplCopyWith<_$OutstandingDebtsReportImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentHistoryEntry {
  DebtTransaction get transaction => throw _privateConstructorUsedError;
  String get debtorName => throw _privateConstructorUsedError;

  /// Create a copy of PaymentHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentHistoryEntryCopyWith<PaymentHistoryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentHistoryEntryCopyWith<$Res> {
  factory $PaymentHistoryEntryCopyWith(
    PaymentHistoryEntry value,
    $Res Function(PaymentHistoryEntry) then,
  ) = _$PaymentHistoryEntryCopyWithImpl<$Res, PaymentHistoryEntry>;
  @useResult
  $Res call({DebtTransaction transaction, String debtorName});

  $DebtTransactionCopyWith<$Res> get transaction;
}

/// @nodoc
class _$PaymentHistoryEntryCopyWithImpl<$Res, $Val extends PaymentHistoryEntry>
    implements $PaymentHistoryEntryCopyWith<$Res> {
  _$PaymentHistoryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? transaction = null, Object? debtorName = null}) {
    return _then(
      _value.copyWith(
            transaction: null == transaction
                ? _value.transaction
                : transaction // ignore: cast_nullable_to_non_nullable
                      as DebtTransaction,
            debtorName: null == debtorName
                ? _value.debtorName
                : debtorName // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of PaymentHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DebtTransactionCopyWith<$Res> get transaction {
    return $DebtTransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentHistoryEntryImplCopyWith<$Res>
    implements $PaymentHistoryEntryCopyWith<$Res> {
  factory _$$PaymentHistoryEntryImplCopyWith(
    _$PaymentHistoryEntryImpl value,
    $Res Function(_$PaymentHistoryEntryImpl) then,
  ) = __$$PaymentHistoryEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DebtTransaction transaction, String debtorName});

  @override
  $DebtTransactionCopyWith<$Res> get transaction;
}

/// @nodoc
class __$$PaymentHistoryEntryImplCopyWithImpl<$Res>
    extends _$PaymentHistoryEntryCopyWithImpl<$Res, _$PaymentHistoryEntryImpl>
    implements _$$PaymentHistoryEntryImplCopyWith<$Res> {
  __$$PaymentHistoryEntryImplCopyWithImpl(
    _$PaymentHistoryEntryImpl _value,
    $Res Function(_$PaymentHistoryEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? transaction = null, Object? debtorName = null}) {
    return _then(
      _$PaymentHistoryEntryImpl(
        transaction: null == transaction
            ? _value.transaction
            : transaction // ignore: cast_nullable_to_non_nullable
                  as DebtTransaction,
        debtorName: null == debtorName
            ? _value.debtorName
            : debtorName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PaymentHistoryEntryImpl implements _PaymentHistoryEntry {
  const _$PaymentHistoryEntryImpl({
    required this.transaction,
    required this.debtorName,
  });

  @override
  final DebtTransaction transaction;
  @override
  final String debtorName;

  @override
  String toString() {
    return 'PaymentHistoryEntry(transaction: $transaction, debtorName: $debtorName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentHistoryEntryImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.debtorName, debtorName) ||
                other.debtorName == debtorName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction, debtorName);

  /// Create a copy of PaymentHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentHistoryEntryImplCopyWith<_$PaymentHistoryEntryImpl> get copyWith =>
      __$$PaymentHistoryEntryImplCopyWithImpl<_$PaymentHistoryEntryImpl>(
        this,
        _$identity,
      );
}

abstract class _PaymentHistoryEntry implements PaymentHistoryEntry {
  const factory _PaymentHistoryEntry({
    required final DebtTransaction transaction,
    required final String debtorName,
  }) = _$PaymentHistoryEntryImpl;

  @override
  DebtTransaction get transaction;
  @override
  String get debtorName;

  /// Create a copy of PaymentHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentHistoryEntryImplCopyWith<_$PaymentHistoryEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentHistoryReport {
  List<PaymentHistoryEntry> get payments => throw _privateConstructorUsedError;
  double get totalReceived => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;

  /// Create a copy of PaymentHistoryReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentHistoryReportCopyWith<PaymentHistoryReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentHistoryReportCopyWith<$Res> {
  factory $PaymentHistoryReportCopyWith(
    PaymentHistoryReport value,
    $Res Function(PaymentHistoryReport) then,
  ) = _$PaymentHistoryReportCopyWithImpl<$Res, PaymentHistoryReport>;
  @useResult
  $Res call({
    List<PaymentHistoryEntry> payments,
    double totalReceived,
    DateTime? startDate,
    DateTime? endDate,
    DateTime generatedAt,
  });
}

/// @nodoc
class _$PaymentHistoryReportCopyWithImpl<
  $Res,
  $Val extends PaymentHistoryReport
>
    implements $PaymentHistoryReportCopyWith<$Res> {
  _$PaymentHistoryReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentHistoryReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payments = null,
    Object? totalReceived = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? generatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            payments: null == payments
                ? _value.payments
                : payments // ignore: cast_nullable_to_non_nullable
                      as List<PaymentHistoryEntry>,
            totalReceived: null == totalReceived
                ? _value.totalReceived
                : totalReceived // ignore: cast_nullable_to_non_nullable
                      as double,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentHistoryReportImplCopyWith<$Res>
    implements $PaymentHistoryReportCopyWith<$Res> {
  factory _$$PaymentHistoryReportImplCopyWith(
    _$PaymentHistoryReportImpl value,
    $Res Function(_$PaymentHistoryReportImpl) then,
  ) = __$$PaymentHistoryReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<PaymentHistoryEntry> payments,
    double totalReceived,
    DateTime? startDate,
    DateTime? endDate,
    DateTime generatedAt,
  });
}

/// @nodoc
class __$$PaymentHistoryReportImplCopyWithImpl<$Res>
    extends _$PaymentHistoryReportCopyWithImpl<$Res, _$PaymentHistoryReportImpl>
    implements _$$PaymentHistoryReportImplCopyWith<$Res> {
  __$$PaymentHistoryReportImplCopyWithImpl(
    _$PaymentHistoryReportImpl _value,
    $Res Function(_$PaymentHistoryReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentHistoryReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payments = null,
    Object? totalReceived = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? generatedAt = null,
  }) {
    return _then(
      _$PaymentHistoryReportImpl(
        payments: null == payments
            ? _value._payments
            : payments // ignore: cast_nullable_to_non_nullable
                  as List<PaymentHistoryEntry>,
        totalReceived: null == totalReceived
            ? _value.totalReceived
            : totalReceived // ignore: cast_nullable_to_non_nullable
                  as double,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$PaymentHistoryReportImpl implements _PaymentHistoryReport {
  const _$PaymentHistoryReportImpl({
    required final List<PaymentHistoryEntry> payments,
    required this.totalReceived,
    this.startDate,
    this.endDate,
    required this.generatedAt,
  }) : _payments = payments;

  final List<PaymentHistoryEntry> _payments;
  @override
  List<PaymentHistoryEntry> get payments {
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payments);
  }

  @override
  final double totalReceived;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final DateTime generatedAt;

  @override
  String toString() {
    return 'PaymentHistoryReport(payments: $payments, totalReceived: $totalReceived, startDate: $startDate, endDate: $endDate, generatedAt: $generatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentHistoryReportImpl &&
            const DeepCollectionEquality().equals(other._payments, _payments) &&
            (identical(other.totalReceived, totalReceived) ||
                other.totalReceived == totalReceived) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_payments),
    totalReceived,
    startDate,
    endDate,
    generatedAt,
  );

  /// Create a copy of PaymentHistoryReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentHistoryReportImplCopyWith<_$PaymentHistoryReportImpl>
  get copyWith =>
      __$$PaymentHistoryReportImplCopyWithImpl<_$PaymentHistoryReportImpl>(
        this,
        _$identity,
      );
}

abstract class _PaymentHistoryReport implements PaymentHistoryReport {
  const factory _PaymentHistoryReport({
    required final List<PaymentHistoryEntry> payments,
    required final double totalReceived,
    final DateTime? startDate,
    final DateTime? endDate,
    required final DateTime generatedAt,
  }) = _$PaymentHistoryReportImpl;

  @override
  List<PaymentHistoryEntry> get payments;
  @override
  double get totalReceived;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  DateTime get generatedAt;

  /// Create a copy of PaymentHistoryReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentHistoryReportImplCopyWith<_$PaymentHistoryReportImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CollectionSummaryReport {
  double get totalLent => throw _privateConstructorUsedError;
  double get totalReceived => throw _privateConstructorUsedError;
  double get totalOutstanding => throw _privateConstructorUsedError;
  double get totalForgiven => throw _privateConstructorUsedError;
  int get totalDebtors => throw _privateConstructorUsedError;
  int get activeDebtors => throw _privateConstructorUsedError;
  int get fullyPaidDebtors => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;

  /// Create a copy of CollectionSummaryReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionSummaryReportCopyWith<CollectionSummaryReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionSummaryReportCopyWith<$Res> {
  factory $CollectionSummaryReportCopyWith(
    CollectionSummaryReport value,
    $Res Function(CollectionSummaryReport) then,
  ) = _$CollectionSummaryReportCopyWithImpl<$Res, CollectionSummaryReport>;
  @useResult
  $Res call({
    double totalLent,
    double totalReceived,
    double totalOutstanding,
    double totalForgiven,
    int totalDebtors,
    int activeDebtors,
    int fullyPaidDebtors,
    DateTime generatedAt,
  });
}

/// @nodoc
class _$CollectionSummaryReportCopyWithImpl<
  $Res,
  $Val extends CollectionSummaryReport
>
    implements $CollectionSummaryReportCopyWith<$Res> {
  _$CollectionSummaryReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionSummaryReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalLent = null,
    Object? totalReceived = null,
    Object? totalOutstanding = null,
    Object? totalForgiven = null,
    Object? totalDebtors = null,
    Object? activeDebtors = null,
    Object? fullyPaidDebtors = null,
    Object? generatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            totalLent: null == totalLent
                ? _value.totalLent
                : totalLent // ignore: cast_nullable_to_non_nullable
                      as double,
            totalReceived: null == totalReceived
                ? _value.totalReceived
                : totalReceived // ignore: cast_nullable_to_non_nullable
                      as double,
            totalOutstanding: null == totalOutstanding
                ? _value.totalOutstanding
                : totalOutstanding // ignore: cast_nullable_to_non_nullable
                      as double,
            totalForgiven: null == totalForgiven
                ? _value.totalForgiven
                : totalForgiven // ignore: cast_nullable_to_non_nullable
                      as double,
            totalDebtors: null == totalDebtors
                ? _value.totalDebtors
                : totalDebtors // ignore: cast_nullable_to_non_nullable
                      as int,
            activeDebtors: null == activeDebtors
                ? _value.activeDebtors
                : activeDebtors // ignore: cast_nullable_to_non_nullable
                      as int,
            fullyPaidDebtors: null == fullyPaidDebtors
                ? _value.fullyPaidDebtors
                : fullyPaidDebtors // ignore: cast_nullable_to_non_nullable
                      as int,
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CollectionSummaryReportImplCopyWith<$Res>
    implements $CollectionSummaryReportCopyWith<$Res> {
  factory _$$CollectionSummaryReportImplCopyWith(
    _$CollectionSummaryReportImpl value,
    $Res Function(_$CollectionSummaryReportImpl) then,
  ) = __$$CollectionSummaryReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double totalLent,
    double totalReceived,
    double totalOutstanding,
    double totalForgiven,
    int totalDebtors,
    int activeDebtors,
    int fullyPaidDebtors,
    DateTime generatedAt,
  });
}

/// @nodoc
class __$$CollectionSummaryReportImplCopyWithImpl<$Res>
    extends
        _$CollectionSummaryReportCopyWithImpl<
          $Res,
          _$CollectionSummaryReportImpl
        >
    implements _$$CollectionSummaryReportImplCopyWith<$Res> {
  __$$CollectionSummaryReportImplCopyWithImpl(
    _$CollectionSummaryReportImpl _value,
    $Res Function(_$CollectionSummaryReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CollectionSummaryReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalLent = null,
    Object? totalReceived = null,
    Object? totalOutstanding = null,
    Object? totalForgiven = null,
    Object? totalDebtors = null,
    Object? activeDebtors = null,
    Object? fullyPaidDebtors = null,
    Object? generatedAt = null,
  }) {
    return _then(
      _$CollectionSummaryReportImpl(
        totalLent: null == totalLent
            ? _value.totalLent
            : totalLent // ignore: cast_nullable_to_non_nullable
                  as double,
        totalReceived: null == totalReceived
            ? _value.totalReceived
            : totalReceived // ignore: cast_nullable_to_non_nullable
                  as double,
        totalOutstanding: null == totalOutstanding
            ? _value.totalOutstanding
            : totalOutstanding // ignore: cast_nullable_to_non_nullable
                  as double,
        totalForgiven: null == totalForgiven
            ? _value.totalForgiven
            : totalForgiven // ignore: cast_nullable_to_non_nullable
                  as double,
        totalDebtors: null == totalDebtors
            ? _value.totalDebtors
            : totalDebtors // ignore: cast_nullable_to_non_nullable
                  as int,
        activeDebtors: null == activeDebtors
            ? _value.activeDebtors
            : activeDebtors // ignore: cast_nullable_to_non_nullable
                  as int,
        fullyPaidDebtors: null == fullyPaidDebtors
            ? _value.fullyPaidDebtors
            : fullyPaidDebtors // ignore: cast_nullable_to_non_nullable
                  as int,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$CollectionSummaryReportImpl implements _CollectionSummaryReport {
  const _$CollectionSummaryReportImpl({
    required this.totalLent,
    required this.totalReceived,
    required this.totalOutstanding,
    required this.totalForgiven,
    required this.totalDebtors,
    required this.activeDebtors,
    required this.fullyPaidDebtors,
    required this.generatedAt,
  });

  @override
  final double totalLent;
  @override
  final double totalReceived;
  @override
  final double totalOutstanding;
  @override
  final double totalForgiven;
  @override
  final int totalDebtors;
  @override
  final int activeDebtors;
  @override
  final int fullyPaidDebtors;
  @override
  final DateTime generatedAt;

  @override
  String toString() {
    return 'CollectionSummaryReport(totalLent: $totalLent, totalReceived: $totalReceived, totalOutstanding: $totalOutstanding, totalForgiven: $totalForgiven, totalDebtors: $totalDebtors, activeDebtors: $activeDebtors, fullyPaidDebtors: $fullyPaidDebtors, generatedAt: $generatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionSummaryReportImpl &&
            (identical(other.totalLent, totalLent) ||
                other.totalLent == totalLent) &&
            (identical(other.totalReceived, totalReceived) ||
                other.totalReceived == totalReceived) &&
            (identical(other.totalOutstanding, totalOutstanding) ||
                other.totalOutstanding == totalOutstanding) &&
            (identical(other.totalForgiven, totalForgiven) ||
                other.totalForgiven == totalForgiven) &&
            (identical(other.totalDebtors, totalDebtors) ||
                other.totalDebtors == totalDebtors) &&
            (identical(other.activeDebtors, activeDebtors) ||
                other.activeDebtors == activeDebtors) &&
            (identical(other.fullyPaidDebtors, fullyPaidDebtors) ||
                other.fullyPaidDebtors == fullyPaidDebtors) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalLent,
    totalReceived,
    totalOutstanding,
    totalForgiven,
    totalDebtors,
    activeDebtors,
    fullyPaidDebtors,
    generatedAt,
  );

  /// Create a copy of CollectionSummaryReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionSummaryReportImplCopyWith<_$CollectionSummaryReportImpl>
  get copyWith =>
      __$$CollectionSummaryReportImplCopyWithImpl<
        _$CollectionSummaryReportImpl
      >(this, _$identity);
}

abstract class _CollectionSummaryReport implements CollectionSummaryReport {
  const factory _CollectionSummaryReport({
    required final double totalLent,
    required final double totalReceived,
    required final double totalOutstanding,
    required final double totalForgiven,
    required final int totalDebtors,
    required final int activeDebtors,
    required final int fullyPaidDebtors,
    required final DateTime generatedAt,
  }) = _$CollectionSummaryReportImpl;

  @override
  double get totalLent;
  @override
  double get totalReceived;
  @override
  double get totalOutstanding;
  @override
  double get totalForgiven;
  @override
  int get totalDebtors;
  @override
  int get activeDebtors;
  @override
  int get fullyPaidDebtors;
  @override
  DateTime get generatedAt;

  /// Create a copy of CollectionSummaryReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionSummaryReportImplCopyWith<_$CollectionSummaryReportImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MonthlyCollectionPoint {
  /// 1-12
  int get month => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyCollectionPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyCollectionPointCopyWith<MonthlyCollectionPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyCollectionPointCopyWith<$Res> {
  factory $MonthlyCollectionPointCopyWith(
    MonthlyCollectionPoint value,
    $Res Function(MonthlyCollectionPoint) then,
  ) = _$MonthlyCollectionPointCopyWithImpl<$Res, MonthlyCollectionPoint>;
  @useResult
  $Res call({int month, double total});
}

/// @nodoc
class _$MonthlyCollectionPointCopyWithImpl<
  $Res,
  $Val extends MonthlyCollectionPoint
>
    implements $MonthlyCollectionPointCopyWith<$Res> {
  _$MonthlyCollectionPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyCollectionPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? month = null, Object? total = null}) {
    return _then(
      _value.copyWith(
            month: null == month
                ? _value.month
                : month // ignore: cast_nullable_to_non_nullable
                      as int,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MonthlyCollectionPointImplCopyWith<$Res>
    implements $MonthlyCollectionPointCopyWith<$Res> {
  factory _$$MonthlyCollectionPointImplCopyWith(
    _$MonthlyCollectionPointImpl value,
    $Res Function(_$MonthlyCollectionPointImpl) then,
  ) = __$$MonthlyCollectionPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int month, double total});
}

/// @nodoc
class __$$MonthlyCollectionPointImplCopyWithImpl<$Res>
    extends
        _$MonthlyCollectionPointCopyWithImpl<$Res, _$MonthlyCollectionPointImpl>
    implements _$$MonthlyCollectionPointImplCopyWith<$Res> {
  __$$MonthlyCollectionPointImplCopyWithImpl(
    _$MonthlyCollectionPointImpl _value,
    $Res Function(_$MonthlyCollectionPointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthlyCollectionPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? month = null, Object? total = null}) {
    return _then(
      _$MonthlyCollectionPointImpl(
        month: null == month
            ? _value.month
            : month // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$MonthlyCollectionPointImpl implements _MonthlyCollectionPoint {
  const _$MonthlyCollectionPointImpl({
    required this.month,
    required this.total,
  });

  /// 1-12
  @override
  final int month;
  @override
  final double total;

  @override
  String toString() {
    return 'MonthlyCollectionPoint(month: $month, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyCollectionPointImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month, total);

  /// Create a copy of MonthlyCollectionPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyCollectionPointImplCopyWith<_$MonthlyCollectionPointImpl>
  get copyWith =>
      __$$MonthlyCollectionPointImplCopyWithImpl<_$MonthlyCollectionPointImpl>(
        this,
        _$identity,
      );
}

abstract class _MonthlyCollectionPoint implements MonthlyCollectionPoint {
  const factory _MonthlyCollectionPoint({
    required final int month,
    required final double total,
  }) = _$MonthlyCollectionPointImpl;

  /// 1-12
  @override
  int get month;
  @override
  double get total;

  /// Create a copy of MonthlyCollectionPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyCollectionPointImplCopyWith<_$MonthlyCollectionPointImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MonthlyCollectionsReport {
  int get year => throw _privateConstructorUsedError;
  List<MonthlyCollectionPoint> get months => throw _privateConstructorUsedError;
  double get totalForYear => throw _privateConstructorUsedError;
  List<int> get availableYears => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyCollectionsReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyCollectionsReportCopyWith<MonthlyCollectionsReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyCollectionsReportCopyWith<$Res> {
  factory $MonthlyCollectionsReportCopyWith(
    MonthlyCollectionsReport value,
    $Res Function(MonthlyCollectionsReport) then,
  ) = _$MonthlyCollectionsReportCopyWithImpl<$Res, MonthlyCollectionsReport>;
  @useResult
  $Res call({
    int year,
    List<MonthlyCollectionPoint> months,
    double totalForYear,
    List<int> availableYears,
    DateTime generatedAt,
  });
}

/// @nodoc
class _$MonthlyCollectionsReportCopyWithImpl<
  $Res,
  $Val extends MonthlyCollectionsReport
>
    implements $MonthlyCollectionsReportCopyWith<$Res> {
  _$MonthlyCollectionsReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyCollectionsReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? months = null,
    Object? totalForYear = null,
    Object? availableYears = null,
    Object? generatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            year: null == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as int,
            months: null == months
                ? _value.months
                : months // ignore: cast_nullable_to_non_nullable
                      as List<MonthlyCollectionPoint>,
            totalForYear: null == totalForYear
                ? _value.totalForYear
                : totalForYear // ignore: cast_nullable_to_non_nullable
                      as double,
            availableYears: null == availableYears
                ? _value.availableYears
                : availableYears // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MonthlyCollectionsReportImplCopyWith<$Res>
    implements $MonthlyCollectionsReportCopyWith<$Res> {
  factory _$$MonthlyCollectionsReportImplCopyWith(
    _$MonthlyCollectionsReportImpl value,
    $Res Function(_$MonthlyCollectionsReportImpl) then,
  ) = __$$MonthlyCollectionsReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int year,
    List<MonthlyCollectionPoint> months,
    double totalForYear,
    List<int> availableYears,
    DateTime generatedAt,
  });
}

/// @nodoc
class __$$MonthlyCollectionsReportImplCopyWithImpl<$Res>
    extends
        _$MonthlyCollectionsReportCopyWithImpl<
          $Res,
          _$MonthlyCollectionsReportImpl
        >
    implements _$$MonthlyCollectionsReportImplCopyWith<$Res> {
  __$$MonthlyCollectionsReportImplCopyWithImpl(
    _$MonthlyCollectionsReportImpl _value,
    $Res Function(_$MonthlyCollectionsReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthlyCollectionsReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? months = null,
    Object? totalForYear = null,
    Object? availableYears = null,
    Object? generatedAt = null,
  }) {
    return _then(
      _$MonthlyCollectionsReportImpl(
        year: null == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as int,
        months: null == months
            ? _value._months
            : months // ignore: cast_nullable_to_non_nullable
                  as List<MonthlyCollectionPoint>,
        totalForYear: null == totalForYear
            ? _value.totalForYear
            : totalForYear // ignore: cast_nullable_to_non_nullable
                  as double,
        availableYears: null == availableYears
            ? _value._availableYears
            : availableYears // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$MonthlyCollectionsReportImpl implements _MonthlyCollectionsReport {
  const _$MonthlyCollectionsReportImpl({
    required this.year,
    required final List<MonthlyCollectionPoint> months,
    required this.totalForYear,
    required final List<int> availableYears,
    required this.generatedAt,
  }) : _months = months,
       _availableYears = availableYears;

  @override
  final int year;
  final List<MonthlyCollectionPoint> _months;
  @override
  List<MonthlyCollectionPoint> get months {
    if (_months is EqualUnmodifiableListView) return _months;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_months);
  }

  @override
  final double totalForYear;
  final List<int> _availableYears;
  @override
  List<int> get availableYears {
    if (_availableYears is EqualUnmodifiableListView) return _availableYears;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableYears);
  }

  @override
  final DateTime generatedAt;

  @override
  String toString() {
    return 'MonthlyCollectionsReport(year: $year, months: $months, totalForYear: $totalForYear, availableYears: $availableYears, generatedAt: $generatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyCollectionsReportImpl &&
            (identical(other.year, year) || other.year == year) &&
            const DeepCollectionEquality().equals(other._months, _months) &&
            (identical(other.totalForYear, totalForYear) ||
                other.totalForYear == totalForYear) &&
            const DeepCollectionEquality().equals(
              other._availableYears,
              _availableYears,
            ) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    year,
    const DeepCollectionEquality().hash(_months),
    totalForYear,
    const DeepCollectionEquality().hash(_availableYears),
    generatedAt,
  );

  /// Create a copy of MonthlyCollectionsReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyCollectionsReportImplCopyWith<_$MonthlyCollectionsReportImpl>
  get copyWith =>
      __$$MonthlyCollectionsReportImplCopyWithImpl<
        _$MonthlyCollectionsReportImpl
      >(this, _$identity);
}

abstract class _MonthlyCollectionsReport implements MonthlyCollectionsReport {
  const factory _MonthlyCollectionsReport({
    required final int year,
    required final List<MonthlyCollectionPoint> months,
    required final double totalForYear,
    required final List<int> availableYears,
    required final DateTime generatedAt,
  }) = _$MonthlyCollectionsReportImpl;

  @override
  int get year;
  @override
  List<MonthlyCollectionPoint> get months;
  @override
  double get totalForYear;
  @override
  List<int> get availableYears;
  @override
  DateTime get generatedAt;

  /// Create a copy of MonthlyCollectionsReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyCollectionsReportImplCopyWith<_$MonthlyCollectionsReportImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnnualCollectionPoint {
  int get year => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  /// Create a copy of AnnualCollectionPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnnualCollectionPointCopyWith<AnnualCollectionPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnualCollectionPointCopyWith<$Res> {
  factory $AnnualCollectionPointCopyWith(
    AnnualCollectionPoint value,
    $Res Function(AnnualCollectionPoint) then,
  ) = _$AnnualCollectionPointCopyWithImpl<$Res, AnnualCollectionPoint>;
  @useResult
  $Res call({int year, double total});
}

/// @nodoc
class _$AnnualCollectionPointCopyWithImpl<
  $Res,
  $Val extends AnnualCollectionPoint
>
    implements $AnnualCollectionPointCopyWith<$Res> {
  _$AnnualCollectionPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnnualCollectionPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? year = null, Object? total = null}) {
    return _then(
      _value.copyWith(
            year: null == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as int,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnnualCollectionPointImplCopyWith<$Res>
    implements $AnnualCollectionPointCopyWith<$Res> {
  factory _$$AnnualCollectionPointImplCopyWith(
    _$AnnualCollectionPointImpl value,
    $Res Function(_$AnnualCollectionPointImpl) then,
  ) = __$$AnnualCollectionPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int year, double total});
}

/// @nodoc
class __$$AnnualCollectionPointImplCopyWithImpl<$Res>
    extends
        _$AnnualCollectionPointCopyWithImpl<$Res, _$AnnualCollectionPointImpl>
    implements _$$AnnualCollectionPointImplCopyWith<$Res> {
  __$$AnnualCollectionPointImplCopyWithImpl(
    _$AnnualCollectionPointImpl _value,
    $Res Function(_$AnnualCollectionPointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnnualCollectionPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? year = null, Object? total = null}) {
    return _then(
      _$AnnualCollectionPointImpl(
        year: null == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$AnnualCollectionPointImpl implements _AnnualCollectionPoint {
  const _$AnnualCollectionPointImpl({required this.year, required this.total});

  @override
  final int year;
  @override
  final double total;

  @override
  String toString() {
    return 'AnnualCollectionPoint(year: $year, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnualCollectionPointImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType, year, total);

  /// Create a copy of AnnualCollectionPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnualCollectionPointImplCopyWith<_$AnnualCollectionPointImpl>
  get copyWith =>
      __$$AnnualCollectionPointImplCopyWithImpl<_$AnnualCollectionPointImpl>(
        this,
        _$identity,
      );
}

abstract class _AnnualCollectionPoint implements AnnualCollectionPoint {
  const factory _AnnualCollectionPoint({
    required final int year,
    required final double total,
  }) = _$AnnualCollectionPointImpl;

  @override
  int get year;
  @override
  double get total;

  /// Create a copy of AnnualCollectionPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnnualCollectionPointImplCopyWith<_$AnnualCollectionPointImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnnualCollectionsReport {
  List<AnnualCollectionPoint> get years => throw _privateConstructorUsedError;
  double get totalAllYears => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;

  /// Create a copy of AnnualCollectionsReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnnualCollectionsReportCopyWith<AnnualCollectionsReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnualCollectionsReportCopyWith<$Res> {
  factory $AnnualCollectionsReportCopyWith(
    AnnualCollectionsReport value,
    $Res Function(AnnualCollectionsReport) then,
  ) = _$AnnualCollectionsReportCopyWithImpl<$Res, AnnualCollectionsReport>;
  @useResult
  $Res call({
    List<AnnualCollectionPoint> years,
    double totalAllYears,
    DateTime generatedAt,
  });
}

/// @nodoc
class _$AnnualCollectionsReportCopyWithImpl<
  $Res,
  $Val extends AnnualCollectionsReport
>
    implements $AnnualCollectionsReportCopyWith<$Res> {
  _$AnnualCollectionsReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnnualCollectionsReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? years = null,
    Object? totalAllYears = null,
    Object? generatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            years: null == years
                ? _value.years
                : years // ignore: cast_nullable_to_non_nullable
                      as List<AnnualCollectionPoint>,
            totalAllYears: null == totalAllYears
                ? _value.totalAllYears
                : totalAllYears // ignore: cast_nullable_to_non_nullable
                      as double,
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnnualCollectionsReportImplCopyWith<$Res>
    implements $AnnualCollectionsReportCopyWith<$Res> {
  factory _$$AnnualCollectionsReportImplCopyWith(
    _$AnnualCollectionsReportImpl value,
    $Res Function(_$AnnualCollectionsReportImpl) then,
  ) = __$$AnnualCollectionsReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<AnnualCollectionPoint> years,
    double totalAllYears,
    DateTime generatedAt,
  });
}

/// @nodoc
class __$$AnnualCollectionsReportImplCopyWithImpl<$Res>
    extends
        _$AnnualCollectionsReportCopyWithImpl<
          $Res,
          _$AnnualCollectionsReportImpl
        >
    implements _$$AnnualCollectionsReportImplCopyWith<$Res> {
  __$$AnnualCollectionsReportImplCopyWithImpl(
    _$AnnualCollectionsReportImpl _value,
    $Res Function(_$AnnualCollectionsReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnnualCollectionsReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? years = null,
    Object? totalAllYears = null,
    Object? generatedAt = null,
  }) {
    return _then(
      _$AnnualCollectionsReportImpl(
        years: null == years
            ? _value._years
            : years // ignore: cast_nullable_to_non_nullable
                  as List<AnnualCollectionPoint>,
        totalAllYears: null == totalAllYears
            ? _value.totalAllYears
            : totalAllYears // ignore: cast_nullable_to_non_nullable
                  as double,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$AnnualCollectionsReportImpl implements _AnnualCollectionsReport {
  const _$AnnualCollectionsReportImpl({
    required final List<AnnualCollectionPoint> years,
    required this.totalAllYears,
    required this.generatedAt,
  }) : _years = years;

  final List<AnnualCollectionPoint> _years;
  @override
  List<AnnualCollectionPoint> get years {
    if (_years is EqualUnmodifiableListView) return _years;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_years);
  }

  @override
  final double totalAllYears;
  @override
  final DateTime generatedAt;

  @override
  String toString() {
    return 'AnnualCollectionsReport(years: $years, totalAllYears: $totalAllYears, generatedAt: $generatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnualCollectionsReportImpl &&
            const DeepCollectionEquality().equals(other._years, _years) &&
            (identical(other.totalAllYears, totalAllYears) ||
                other.totalAllYears == totalAllYears) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_years),
    totalAllYears,
    generatedAt,
  );

  /// Create a copy of AnnualCollectionsReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnualCollectionsReportImplCopyWith<_$AnnualCollectionsReportImpl>
  get copyWith =>
      __$$AnnualCollectionsReportImplCopyWithImpl<
        _$AnnualCollectionsReportImpl
      >(this, _$identity);
}

abstract class _AnnualCollectionsReport implements AnnualCollectionsReport {
  const factory _AnnualCollectionsReport({
    required final List<AnnualCollectionPoint> years,
    required final double totalAllYears,
    required final DateTime generatedAt,
  }) = _$AnnualCollectionsReportImpl;

  @override
  List<AnnualCollectionPoint> get years;
  @override
  double get totalAllYears;
  @override
  DateTime get generatedAt;

  /// Create a copy of AnnualCollectionsReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnnualCollectionsReportImplCopyWith<_$AnnualCollectionsReportImpl>
  get copyWith => throw _privateConstructorUsedError;
}
