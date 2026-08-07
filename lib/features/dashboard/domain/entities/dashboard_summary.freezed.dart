// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DashboardSummary {
  double get totalOutstanding => throw _privateConstructorUsedError;
  double get totalLent => throw _privateConstructorUsedError;
  double get totalReceived => throw _privateConstructorUsedError;
  int get totalDebtors => throw _privateConstructorUsedError;
  int get activeDebtors => throw _privateConstructorUsedError;
  int get fullyPaidDebtors => throw _privateConstructorUsedError;
  double get largestOutstandingBalance => throw _privateConstructorUsedError;
  String? get largestOutstandingDebtorName =>
      throw _privateConstructorUsedError;
  List<DebtTransaction> get recentTransactions =>
      throw _privateConstructorUsedError;

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardSummaryCopyWith<DashboardSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardSummaryCopyWith<$Res> {
  factory $DashboardSummaryCopyWith(
    DashboardSummary value,
    $Res Function(DashboardSummary) then,
  ) = _$DashboardSummaryCopyWithImpl<$Res, DashboardSummary>;
  @useResult
  $Res call({
    double totalOutstanding,
    double totalLent,
    double totalReceived,
    int totalDebtors,
    int activeDebtors,
    int fullyPaidDebtors,
    double largestOutstandingBalance,
    String? largestOutstandingDebtorName,
    List<DebtTransaction> recentTransactions,
  });
}

/// @nodoc
class _$DashboardSummaryCopyWithImpl<$Res, $Val extends DashboardSummary>
    implements $DashboardSummaryCopyWith<$Res> {
  _$DashboardSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalOutstanding = null,
    Object? totalLent = null,
    Object? totalReceived = null,
    Object? totalDebtors = null,
    Object? activeDebtors = null,
    Object? fullyPaidDebtors = null,
    Object? largestOutstandingBalance = null,
    Object? largestOutstandingDebtorName = freezed,
    Object? recentTransactions = null,
  }) {
    return _then(
      _value.copyWith(
            totalOutstanding: null == totalOutstanding
                ? _value.totalOutstanding
                : totalOutstanding // ignore: cast_nullable_to_non_nullable
                      as double,
            totalLent: null == totalLent
                ? _value.totalLent
                : totalLent // ignore: cast_nullable_to_non_nullable
                      as double,
            totalReceived: null == totalReceived
                ? _value.totalReceived
                : totalReceived // ignore: cast_nullable_to_non_nullable
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
            largestOutstandingBalance: null == largestOutstandingBalance
                ? _value.largestOutstandingBalance
                : largestOutstandingBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            largestOutstandingDebtorName:
                freezed == largestOutstandingDebtorName
                ? _value.largestOutstandingDebtorName
                : largestOutstandingDebtorName // ignore: cast_nullable_to_non_nullable
                      as String?,
            recentTransactions: null == recentTransactions
                ? _value.recentTransactions
                : recentTransactions // ignore: cast_nullable_to_non_nullable
                      as List<DebtTransaction>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DashboardSummaryImplCopyWith<$Res>
    implements $DashboardSummaryCopyWith<$Res> {
  factory _$$DashboardSummaryImplCopyWith(
    _$DashboardSummaryImpl value,
    $Res Function(_$DashboardSummaryImpl) then,
  ) = __$$DashboardSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double totalOutstanding,
    double totalLent,
    double totalReceived,
    int totalDebtors,
    int activeDebtors,
    int fullyPaidDebtors,
    double largestOutstandingBalance,
    String? largestOutstandingDebtorName,
    List<DebtTransaction> recentTransactions,
  });
}

/// @nodoc
class __$$DashboardSummaryImplCopyWithImpl<$Res>
    extends _$DashboardSummaryCopyWithImpl<$Res, _$DashboardSummaryImpl>
    implements _$$DashboardSummaryImplCopyWith<$Res> {
  __$$DashboardSummaryImplCopyWithImpl(
    _$DashboardSummaryImpl _value,
    $Res Function(_$DashboardSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalOutstanding = null,
    Object? totalLent = null,
    Object? totalReceived = null,
    Object? totalDebtors = null,
    Object? activeDebtors = null,
    Object? fullyPaidDebtors = null,
    Object? largestOutstandingBalance = null,
    Object? largestOutstandingDebtorName = freezed,
    Object? recentTransactions = null,
  }) {
    return _then(
      _$DashboardSummaryImpl(
        totalOutstanding: null == totalOutstanding
            ? _value.totalOutstanding
            : totalOutstanding // ignore: cast_nullable_to_non_nullable
                  as double,
        totalLent: null == totalLent
            ? _value.totalLent
            : totalLent // ignore: cast_nullable_to_non_nullable
                  as double,
        totalReceived: null == totalReceived
            ? _value.totalReceived
            : totalReceived // ignore: cast_nullable_to_non_nullable
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
        largestOutstandingBalance: null == largestOutstandingBalance
            ? _value.largestOutstandingBalance
            : largestOutstandingBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        largestOutstandingDebtorName: freezed == largestOutstandingDebtorName
            ? _value.largestOutstandingDebtorName
            : largestOutstandingDebtorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        recentTransactions: null == recentTransactions
            ? _value._recentTransactions
            : recentTransactions // ignore: cast_nullable_to_non_nullable
                  as List<DebtTransaction>,
      ),
    );
  }
}

/// @nodoc

class _$DashboardSummaryImpl implements _DashboardSummary {
  const _$DashboardSummaryImpl({
    required this.totalOutstanding,
    required this.totalLent,
    required this.totalReceived,
    required this.totalDebtors,
    required this.activeDebtors,
    required this.fullyPaidDebtors,
    required this.largestOutstandingBalance,
    this.largestOutstandingDebtorName,
    required final List<DebtTransaction> recentTransactions,
  }) : _recentTransactions = recentTransactions;

  @override
  final double totalOutstanding;
  @override
  final double totalLent;
  @override
  final double totalReceived;
  @override
  final int totalDebtors;
  @override
  final int activeDebtors;
  @override
  final int fullyPaidDebtors;
  @override
  final double largestOutstandingBalance;
  @override
  final String? largestOutstandingDebtorName;
  final List<DebtTransaction> _recentTransactions;
  @override
  List<DebtTransaction> get recentTransactions {
    if (_recentTransactions is EqualUnmodifiableListView)
      return _recentTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentTransactions);
  }

  @override
  String toString() {
    return 'DashboardSummary(totalOutstanding: $totalOutstanding, totalLent: $totalLent, totalReceived: $totalReceived, totalDebtors: $totalDebtors, activeDebtors: $activeDebtors, fullyPaidDebtors: $fullyPaidDebtors, largestOutstandingBalance: $largestOutstandingBalance, largestOutstandingDebtorName: $largestOutstandingDebtorName, recentTransactions: $recentTransactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardSummaryImpl &&
            (identical(other.totalOutstanding, totalOutstanding) ||
                other.totalOutstanding == totalOutstanding) &&
            (identical(other.totalLent, totalLent) ||
                other.totalLent == totalLent) &&
            (identical(other.totalReceived, totalReceived) ||
                other.totalReceived == totalReceived) &&
            (identical(other.totalDebtors, totalDebtors) ||
                other.totalDebtors == totalDebtors) &&
            (identical(other.activeDebtors, activeDebtors) ||
                other.activeDebtors == activeDebtors) &&
            (identical(other.fullyPaidDebtors, fullyPaidDebtors) ||
                other.fullyPaidDebtors == fullyPaidDebtors) &&
            (identical(
                  other.largestOutstandingBalance,
                  largestOutstandingBalance,
                ) ||
                other.largestOutstandingBalance == largestOutstandingBalance) &&
            (identical(
                  other.largestOutstandingDebtorName,
                  largestOutstandingDebtorName,
                ) ||
                other.largestOutstandingDebtorName ==
                    largestOutstandingDebtorName) &&
            const DeepCollectionEquality().equals(
              other._recentTransactions,
              _recentTransactions,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalOutstanding,
    totalLent,
    totalReceived,
    totalDebtors,
    activeDebtors,
    fullyPaidDebtors,
    largestOutstandingBalance,
    largestOutstandingDebtorName,
    const DeepCollectionEquality().hash(_recentTransactions),
  );

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardSummaryImplCopyWith<_$DashboardSummaryImpl> get copyWith =>
      __$$DashboardSummaryImplCopyWithImpl<_$DashboardSummaryImpl>(
        this,
        _$identity,
      );
}

abstract class _DashboardSummary implements DashboardSummary {
  const factory _DashboardSummary({
    required final double totalOutstanding,
    required final double totalLent,
    required final double totalReceived,
    required final int totalDebtors,
    required final int activeDebtors,
    required final int fullyPaidDebtors,
    required final double largestOutstandingBalance,
    final String? largestOutstandingDebtorName,
    required final List<DebtTransaction> recentTransactions,
  }) = _$DashboardSummaryImpl;

  @override
  double get totalOutstanding;
  @override
  double get totalLent;
  @override
  double get totalReceived;
  @override
  int get totalDebtors;
  @override
  int get activeDebtors;
  @override
  int get fullyPaidDebtors;
  @override
  double get largestOutstandingBalance;
  @override
  String? get largestOutstandingDebtorName;
  @override
  List<DebtTransaction> get recentTransactions;

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardSummaryImplCopyWith<_$DashboardSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
