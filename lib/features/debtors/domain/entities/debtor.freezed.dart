// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'debtor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Debtor {
  int get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get photoPath => throw _privateConstructorUsedError;
  DateTime get dateAdded => throw _privateConstructorUsedError;
  bool get isArchived => throw _privateConstructorUsedError;

  /// Create a copy of Debtor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DebtorCopyWith<Debtor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DebtorCopyWith<$Res> {
  factory $DebtorCopyWith(Debtor value, $Res Function(Debtor) then) =
      _$DebtorCopyWithImpl<$Res, Debtor>;
  @useResult
  $Res call({
    int id,
    String uuid,
    String fullName,
    String? nickname,
    String? mobile,
    String? address,
    String? notes,
    String? photoPath,
    DateTime dateAdded,
    bool isArchived,
  });
}

/// @nodoc
class _$DebtorCopyWithImpl<$Res, $Val extends Debtor>
    implements $DebtorCopyWith<$Res> {
  _$DebtorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Debtor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? fullName = null,
    Object? nickname = freezed,
    Object? mobile = freezed,
    Object? address = freezed,
    Object? notes = freezed,
    Object? photoPath = freezed,
    Object? dateAdded = null,
    Object? isArchived = null,
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
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            nickname: freezed == nickname
                ? _value.nickname
                : nickname // ignore: cast_nullable_to_non_nullable
                      as String?,
            mobile: freezed == mobile
                ? _value.mobile
                : mobile // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            photoPath: freezed == photoPath
                ? _value.photoPath
                : photoPath // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateAdded: null == dateAdded
                ? _value.dateAdded
                : dateAdded // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isArchived: null == isArchived
                ? _value.isArchived
                : isArchived // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DebtorImplCopyWith<$Res> implements $DebtorCopyWith<$Res> {
  factory _$$DebtorImplCopyWith(
    _$DebtorImpl value,
    $Res Function(_$DebtorImpl) then,
  ) = __$$DebtorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String uuid,
    String fullName,
    String? nickname,
    String? mobile,
    String? address,
    String? notes,
    String? photoPath,
    DateTime dateAdded,
    bool isArchived,
  });
}

/// @nodoc
class __$$DebtorImplCopyWithImpl<$Res>
    extends _$DebtorCopyWithImpl<$Res, _$DebtorImpl>
    implements _$$DebtorImplCopyWith<$Res> {
  __$$DebtorImplCopyWithImpl(
    _$DebtorImpl _value,
    $Res Function(_$DebtorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Debtor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? fullName = null,
    Object? nickname = freezed,
    Object? mobile = freezed,
    Object? address = freezed,
    Object? notes = freezed,
    Object? photoPath = freezed,
    Object? dateAdded = null,
    Object? isArchived = null,
  }) {
    return _then(
      _$DebtorImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        uuid: null == uuid
            ? _value.uuid
            : uuid // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        nickname: freezed == nickname
            ? _value.nickname
            : nickname // ignore: cast_nullable_to_non_nullable
                  as String?,
        mobile: freezed == mobile
            ? _value.mobile
            : mobile // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        photoPath: freezed == photoPath
            ? _value.photoPath
            : photoPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateAdded: null == dateAdded
            ? _value.dateAdded
            : dateAdded // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isArchived: null == isArchived
            ? _value.isArchived
            : isArchived // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DebtorImpl implements _Debtor {
  const _$DebtorImpl({
    required this.id,
    required this.uuid,
    required this.fullName,
    this.nickname,
    this.mobile,
    this.address,
    this.notes,
    this.photoPath,
    required this.dateAdded,
    required this.isArchived,
  });

  @override
  final int id;
  @override
  final String uuid;
  @override
  final String fullName;
  @override
  final String? nickname;
  @override
  final String? mobile;
  @override
  final String? address;
  @override
  final String? notes;
  @override
  final String? photoPath;
  @override
  final DateTime dateAdded;
  @override
  final bool isArchived;

  @override
  String toString() {
    return 'Debtor(id: $id, uuid: $uuid, fullName: $fullName, nickname: $nickname, mobile: $mobile, address: $address, notes: $notes, photoPath: $photoPath, dateAdded: $dateAdded, isArchived: $isArchived)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DebtorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.photoPath, photoPath) ||
                other.photoPath == photoPath) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    uuid,
    fullName,
    nickname,
    mobile,
    address,
    notes,
    photoPath,
    dateAdded,
    isArchived,
  );

  /// Create a copy of Debtor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DebtorImplCopyWith<_$DebtorImpl> get copyWith =>
      __$$DebtorImplCopyWithImpl<_$DebtorImpl>(this, _$identity);
}

abstract class _Debtor implements Debtor {
  const factory _Debtor({
    required final int id,
    required final String uuid,
    required final String fullName,
    final String? nickname,
    final String? mobile,
    final String? address,
    final String? notes,
    final String? photoPath,
    required final DateTime dateAdded,
    required final bool isArchived,
  }) = _$DebtorImpl;

  @override
  int get id;
  @override
  String get uuid;
  @override
  String get fullName;
  @override
  String? get nickname;
  @override
  String? get mobile;
  @override
  String? get address;
  @override
  String? get notes;
  @override
  String? get photoPath;
  @override
  DateTime get dateAdded;
  @override
  bool get isArchived;

  /// Create a copy of Debtor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DebtorImplCopyWith<_$DebtorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DebtorInput {
  String get fullName => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get photoPath => throw _privateConstructorUsedError;

  /// Create a copy of DebtorInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DebtorInputCopyWith<DebtorInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DebtorInputCopyWith<$Res> {
  factory $DebtorInputCopyWith(
    DebtorInput value,
    $Res Function(DebtorInput) then,
  ) = _$DebtorInputCopyWithImpl<$Res, DebtorInput>;
  @useResult
  $Res call({
    String fullName,
    String? nickname,
    String? mobile,
    String? address,
    String? notes,
    String? photoPath,
  });
}

/// @nodoc
class _$DebtorInputCopyWithImpl<$Res, $Val extends DebtorInput>
    implements $DebtorInputCopyWith<$Res> {
  _$DebtorInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DebtorInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? nickname = freezed,
    Object? mobile = freezed,
    Object? address = freezed,
    Object? notes = freezed,
    Object? photoPath = freezed,
  }) {
    return _then(
      _value.copyWith(
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            nickname: freezed == nickname
                ? _value.nickname
                : nickname // ignore: cast_nullable_to_non_nullable
                      as String?,
            mobile: freezed == mobile
                ? _value.mobile
                : mobile // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            photoPath: freezed == photoPath
                ? _value.photoPath
                : photoPath // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DebtorInputImplCopyWith<$Res>
    implements $DebtorInputCopyWith<$Res> {
  factory _$$DebtorInputImplCopyWith(
    _$DebtorInputImpl value,
    $Res Function(_$DebtorInputImpl) then,
  ) = __$$DebtorInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String fullName,
    String? nickname,
    String? mobile,
    String? address,
    String? notes,
    String? photoPath,
  });
}

/// @nodoc
class __$$DebtorInputImplCopyWithImpl<$Res>
    extends _$DebtorInputCopyWithImpl<$Res, _$DebtorInputImpl>
    implements _$$DebtorInputImplCopyWith<$Res> {
  __$$DebtorInputImplCopyWithImpl(
    _$DebtorInputImpl _value,
    $Res Function(_$DebtorInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DebtorInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? nickname = freezed,
    Object? mobile = freezed,
    Object? address = freezed,
    Object? notes = freezed,
    Object? photoPath = freezed,
  }) {
    return _then(
      _$DebtorInputImpl(
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        nickname: freezed == nickname
            ? _value.nickname
            : nickname // ignore: cast_nullable_to_non_nullable
                  as String?,
        mobile: freezed == mobile
            ? _value.mobile
            : mobile // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        photoPath: freezed == photoPath
            ? _value.photoPath
            : photoPath // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DebtorInputImpl implements _DebtorInput {
  const _$DebtorInputImpl({
    required this.fullName,
    this.nickname,
    this.mobile,
    this.address,
    this.notes,
    this.photoPath,
  });

  @override
  final String fullName;
  @override
  final String? nickname;
  @override
  final String? mobile;
  @override
  final String? address;
  @override
  final String? notes;
  @override
  final String? photoPath;

  @override
  String toString() {
    return 'DebtorInput(fullName: $fullName, nickname: $nickname, mobile: $mobile, address: $address, notes: $notes, photoPath: $photoPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DebtorInputImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.photoPath, photoPath) ||
                other.photoPath == photoPath));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    fullName,
    nickname,
    mobile,
    address,
    notes,
    photoPath,
  );

  /// Create a copy of DebtorInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DebtorInputImplCopyWith<_$DebtorInputImpl> get copyWith =>
      __$$DebtorInputImplCopyWithImpl<_$DebtorInputImpl>(this, _$identity);
}

abstract class _DebtorInput implements DebtorInput {
  const factory _DebtorInput({
    required final String fullName,
    final String? nickname,
    final String? mobile,
    final String? address,
    final String? notes,
    final String? photoPath,
  }) = _$DebtorInputImpl;

  @override
  String get fullName;
  @override
  String? get nickname;
  @override
  String? get mobile;
  @override
  String? get address;
  @override
  String? get notes;
  @override
  String? get photoPath;

  /// Create a copy of DebtorInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DebtorInputImplCopyWith<_$DebtorInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
