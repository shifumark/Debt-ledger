// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_manifest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BackupManifest _$BackupManifestFromJson(Map<String, dynamic> json) {
  return _BackupManifest.fromJson(json);
}

/// @nodoc
mixin _$BackupManifest {
  String get appVersion => throw _privateConstructorUsedError;
  int get schemaVersion => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get debtorCount => throw _privateConstructorUsedError;
  int get transactionCount => throw _privateConstructorUsedError;

  /// Serializes this BackupManifest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BackupManifest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BackupManifestCopyWith<BackupManifest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackupManifestCopyWith<$Res> {
  factory $BackupManifestCopyWith(
    BackupManifest value,
    $Res Function(BackupManifest) then,
  ) = _$BackupManifestCopyWithImpl<$Res, BackupManifest>;
  @useResult
  $Res call({
    String appVersion,
    int schemaVersion,
    DateTime createdAt,
    int debtorCount,
    int transactionCount,
  });
}

/// @nodoc
class _$BackupManifestCopyWithImpl<$Res, $Val extends BackupManifest>
    implements $BackupManifestCopyWith<$Res> {
  _$BackupManifestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BackupManifest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appVersion = null,
    Object? schemaVersion = null,
    Object? createdAt = null,
    Object? debtorCount = null,
    Object? transactionCount = null,
  }) {
    return _then(
      _value.copyWith(
            appVersion: null == appVersion
                ? _value.appVersion
                : appVersion // ignore: cast_nullable_to_non_nullable
                      as String,
            schemaVersion: null == schemaVersion
                ? _value.schemaVersion
                : schemaVersion // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            debtorCount: null == debtorCount
                ? _value.debtorCount
                : debtorCount // ignore: cast_nullable_to_non_nullable
                      as int,
            transactionCount: null == transactionCount
                ? _value.transactionCount
                : transactionCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BackupManifestImplCopyWith<$Res>
    implements $BackupManifestCopyWith<$Res> {
  factory _$$BackupManifestImplCopyWith(
    _$BackupManifestImpl value,
    $Res Function(_$BackupManifestImpl) then,
  ) = __$$BackupManifestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String appVersion,
    int schemaVersion,
    DateTime createdAt,
    int debtorCount,
    int transactionCount,
  });
}

/// @nodoc
class __$$BackupManifestImplCopyWithImpl<$Res>
    extends _$BackupManifestCopyWithImpl<$Res, _$BackupManifestImpl>
    implements _$$BackupManifestImplCopyWith<$Res> {
  __$$BackupManifestImplCopyWithImpl(
    _$BackupManifestImpl _value,
    $Res Function(_$BackupManifestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BackupManifest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appVersion = null,
    Object? schemaVersion = null,
    Object? createdAt = null,
    Object? debtorCount = null,
    Object? transactionCount = null,
  }) {
    return _then(
      _$BackupManifestImpl(
        appVersion: null == appVersion
            ? _value.appVersion
            : appVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        schemaVersion: null == schemaVersion
            ? _value.schemaVersion
            : schemaVersion // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        debtorCount: null == debtorCount
            ? _value.debtorCount
            : debtorCount // ignore: cast_nullable_to_non_nullable
                  as int,
        transactionCount: null == transactionCount
            ? _value.transactionCount
            : transactionCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BackupManifestImpl implements _BackupManifest {
  const _$BackupManifestImpl({
    required this.appVersion,
    required this.schemaVersion,
    required this.createdAt,
    required this.debtorCount,
    required this.transactionCount,
  });

  factory _$BackupManifestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackupManifestImplFromJson(json);

  @override
  final String appVersion;
  @override
  final int schemaVersion;
  @override
  final DateTime createdAt;
  @override
  final int debtorCount;
  @override
  final int transactionCount;

  @override
  String toString() {
    return 'BackupManifest(appVersion: $appVersion, schemaVersion: $schemaVersion, createdAt: $createdAt, debtorCount: $debtorCount, transactionCount: $transactionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackupManifestImpl &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.schemaVersion, schemaVersion) ||
                other.schemaVersion == schemaVersion) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.debtorCount, debtorCount) ||
                other.debtorCount == debtorCount) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    appVersion,
    schemaVersion,
    createdAt,
    debtorCount,
    transactionCount,
  );

  /// Create a copy of BackupManifest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BackupManifestImplCopyWith<_$BackupManifestImpl> get copyWith =>
      __$$BackupManifestImplCopyWithImpl<_$BackupManifestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BackupManifestImplToJson(this);
  }
}

abstract class _BackupManifest implements BackupManifest {
  const factory _BackupManifest({
    required final String appVersion,
    required final int schemaVersion,
    required final DateTime createdAt,
    required final int debtorCount,
    required final int transactionCount,
  }) = _$BackupManifestImpl;

  factory _BackupManifest.fromJson(Map<String, dynamic> json) =
      _$BackupManifestImpl.fromJson;

  @override
  String get appVersion;
  @override
  int get schemaVersion;
  @override
  DateTime get createdAt;
  @override
  int get debtorCount;
  @override
  int get transactionCount;

  /// Create a copy of BackupManifest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BackupManifestImplCopyWith<_$BackupManifestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
