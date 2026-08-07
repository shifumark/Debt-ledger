// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DebtorsTable extends Debtors with TableInfo<$DebtorsTable, DebtorRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DebtorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 120,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nicknameMeta = const VerificationMeta(
    'nickname',
  );
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
    'nickname',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 60),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mobileMeta = const VerificationMeta('mobile');
  @override
  late final GeneratedColumn<String> mobile = GeneratedColumn<String>(
    'mobile',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 30),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 500),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 2000),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateAddedMeta = const VerificationMeta(
    'dateAdded',
  );
  @override
  late final GeneratedColumn<DateTime> dateAdded = GeneratedColumn<DateTime>(
    'date_added',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
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
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'debtors';
  @override
  VerificationContext validateIntegrity(
    Insertable<DebtorRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('nickname')) {
      context.handle(
        _nicknameMeta,
        nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta),
      );
    }
    if (data.containsKey('mobile')) {
      context.handle(
        _mobileMeta,
        mobile.isAcceptableOrUnknown(data['mobile']!, _mobileMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('date_added')) {
      context.handle(
        _dateAddedMeta,
        dateAdded.isAcceptableOrUnknown(data['date_added']!, _dateAddedMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {uuid},
  ];
  @override
  DebtorRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DebtorRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      nickname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nickname'],
      ),
      mobile: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mobile'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
      dateAdded: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_added'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DebtorsTable createAlias(String alias) {
    return $DebtorsTable(attachedDatabase, alias);
  }
}

class DebtorRow extends DataClass implements Insertable<DebtorRow> {
  final int id;
  final String uuid;
  final String fullName;
  final String? nickname;
  final String? mobile;
  final String? address;
  final String? notes;
  final String? photoPath;
  final DateTime dateAdded;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DebtorRow({
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
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['full_name'] = Variable<String>(fullName);
    if (!nullToAbsent || nickname != null) {
      map['nickname'] = Variable<String>(nickname);
    }
    if (!nullToAbsent || mobile != null) {
      map['mobile'] = Variable<String>(mobile);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    map['date_added'] = Variable<DateTime>(dateAdded);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DebtorsCompanion toCompanion(bool nullToAbsent) {
    return DebtorsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      fullName: Value(fullName),
      nickname: nickname == null && nullToAbsent
          ? const Value.absent()
          : Value(nickname),
      mobile: mobile == null && nullToAbsent
          ? const Value.absent()
          : Value(mobile),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      dateAdded: Value(dateAdded),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DebtorRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DebtorRow(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      fullName: serializer.fromJson<String>(json['fullName']),
      nickname: serializer.fromJson<String?>(json['nickname']),
      mobile: serializer.fromJson<String?>(json['mobile']),
      address: serializer.fromJson<String?>(json['address']),
      notes: serializer.fromJson<String?>(json['notes']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'fullName': serializer.toJson<String>(fullName),
      'nickname': serializer.toJson<String?>(nickname),
      'mobile': serializer.toJson<String?>(mobile),
      'address': serializer.toJson<String?>(address),
      'notes': serializer.toJson<String?>(notes),
      'photoPath': serializer.toJson<String?>(photoPath),
      'dateAdded': serializer.toJson<DateTime>(dateAdded),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DebtorRow copyWith({
    int? id,
    String? uuid,
    String? fullName,
    Value<String?> nickname = const Value.absent(),
    Value<String?> mobile = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> photoPath = const Value.absent(),
    DateTime? dateAdded,
    bool? isArchived,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => DebtorRow(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    fullName: fullName ?? this.fullName,
    nickname: nickname.present ? nickname.value : this.nickname,
    mobile: mobile.present ? mobile.value : this.mobile,
    address: address.present ? address.value : this.address,
    notes: notes.present ? notes.value : this.notes,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
    dateAdded: dateAdded ?? this.dateAdded,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DebtorRow copyWithCompanion(DebtorsCompanion data) {
    return DebtorRow(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
      mobile: data.mobile.present ? data.mobile.value : this.mobile,
      address: data.address.present ? data.address.value : this.address,
      notes: data.notes.present ? data.notes.value : this.notes,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      dateAdded: data.dateAdded.present ? data.dateAdded.value : this.dateAdded,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DebtorRow(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('fullName: $fullName, ')
          ..write('nickname: $nickname, ')
          ..write('mobile: $mobile, ')
          ..write('address: $address, ')
          ..write('notes: $notes, ')
          ..write('photoPath: $photoPath, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DebtorRow &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.fullName == this.fullName &&
          other.nickname == this.nickname &&
          other.mobile == this.mobile &&
          other.address == this.address &&
          other.notes == this.notes &&
          other.photoPath == this.photoPath &&
          other.dateAdded == this.dateAdded &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DebtorsCompanion extends UpdateCompanion<DebtorRow> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> fullName;
  final Value<String?> nickname;
  final Value<String?> mobile;
  final Value<String?> address;
  final Value<String?> notes;
  final Value<String?> photoPath;
  final Value<DateTime> dateAdded;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DebtorsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.fullName = const Value.absent(),
    this.nickname = const Value.absent(),
    this.mobile = const Value.absent(),
    this.address = const Value.absent(),
    this.notes = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DebtorsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String fullName,
    this.nickname = const Value.absent(),
    this.mobile = const Value.absent(),
    this.address = const Value.absent(),
    this.notes = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : uuid = Value(uuid),
       fullName = Value(fullName);
  static Insertable<DebtorRow> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? fullName,
    Expression<String>? nickname,
    Expression<String>? mobile,
    Expression<String>? address,
    Expression<String>? notes,
    Expression<String>? photoPath,
    Expression<DateTime>? dateAdded,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (fullName != null) 'full_name': fullName,
      if (nickname != null) 'nickname': nickname,
      if (mobile != null) 'mobile': mobile,
      if (address != null) 'address': address,
      if (notes != null) 'notes': notes,
      if (photoPath != null) 'photo_path': photoPath,
      if (dateAdded != null) 'date_added': dateAdded,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DebtorsCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<String>? fullName,
    Value<String?>? nickname,
    Value<String?>? mobile,
    Value<String?>? address,
    Value<String?>? notes,
    Value<String?>? photoPath,
    Value<DateTime>? dateAdded,
    Value<bool>? isArchived,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return DebtorsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      fullName: fullName ?? this.fullName,
      nickname: nickname ?? this.nickname,
      mobile: mobile ?? this.mobile,
      address: address ?? this.address,
      notes: notes ?? this.notes,
      photoPath: photoPath ?? this.photoPath,
      dateAdded: dateAdded ?? this.dateAdded,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (mobile.present) {
      map['mobile'] = Variable<String>(mobile.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DebtorsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('fullName: $fullName, ')
          ..write('nickname: $nickname, ')
          ..write('mobile: $mobile, ')
          ..write('address: $address, ')
          ..write('notes: $notes, ')
          ..write('photoPath: $photoPath, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, TransactionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _debtorIdMeta = const VerificationMeta(
    'debtorId',
  );
  @override
  late final GeneratedColumn<int> debtorId = GeneratedColumn<int>(
    'debtor_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES debtors (id) ON DELETE CASCADE',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<TransactionTypeColumn, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<TransactionTypeColumn>($TransactionsTable.$convertertype);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 500),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _attachmentPathMeta = const VerificationMeta(
    'attachmentPath',
  );
  @override
  late final GeneratedColumn<String> attachmentPath = GeneratedColumn<String>(
    'attachment_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<AdjustmentDirectionColumn?, int>
  adjustmentDirection =
      GeneratedColumn<int>(
        'adjustment_direction',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<AdjustmentDirectionColumn?>(
        $TransactionsTable.$converteradjustmentDirectionn,
      );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 500),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
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
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('debtor_id')) {
      context.handle(
        _debtorIdMeta,
        debtorId.isAcceptableOrUnknown(data['debtor_id']!, _debtorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_debtorIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('attachment_path')) {
      context.handle(
        _attachmentPathMeta,
        attachmentPath.isAcceptableOrUnknown(
          data['attachment_path']!,
          _attachmentPathMeta,
        ),
      );
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {uuid},
  ];
  @override
  TransactionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      debtorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}debtor_id'],
      )!,
      type: $TransactionsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      attachmentPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attachment_path'],
      ),
      adjustmentDirection: $TransactionsTable.$converteradjustmentDirectionn
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.int,
              data['${effectivePrefix}adjustment_direction'],
            ),
          ),
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TransactionTypeColumn, int, int> $convertertype =
      const EnumIndexConverter<TransactionTypeColumn>(
        TransactionTypeColumn.values,
      );
  static JsonTypeConverter2<AdjustmentDirectionColumn, int, int>
  $converteradjustmentDirection =
      const EnumIndexConverter<AdjustmentDirectionColumn>(
        AdjustmentDirectionColumn.values,
      );
  static JsonTypeConverter2<AdjustmentDirectionColumn?, int?, int?>
  $converteradjustmentDirectionn = JsonTypeConverter2.asNullable(
    $converteradjustmentDirection,
  );
}

class TransactionRow extends DataClass implements Insertable<TransactionRow> {
  final int id;
  final String uuid;
  final int debtorId;
  final TransactionTypeColumn type;
  final double amount;
  final DateTime date;
  final String? description;
  final String? attachmentPath;
  final AdjustmentDirectionColumn? adjustmentDirection;
  final String? reason;
  final DateTime createdAt;
  final DateTime updatedAt;
  const TransactionRow({
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
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['debtor_id'] = Variable<int>(debtorId);
    {
      map['type'] = Variable<int>(
        $TransactionsTable.$convertertype.toSql(type),
      );
    }
    map['amount'] = Variable<double>(amount);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || attachmentPath != null) {
      map['attachment_path'] = Variable<String>(attachmentPath);
    }
    if (!nullToAbsent || adjustmentDirection != null) {
      map['adjustment_direction'] = Variable<int>(
        $TransactionsTable.$converteradjustmentDirectionn.toSql(
          adjustmentDirection,
        ),
      );
    }
    if (!nullToAbsent || reason != null) {
      map['reason'] = Variable<String>(reason);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      debtorId: Value(debtorId),
      type: Value(type),
      amount: Value(amount),
      date: Value(date),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      attachmentPath: attachmentPath == null && nullToAbsent
          ? const Value.absent()
          : Value(attachmentPath),
      adjustmentDirection: adjustmentDirection == null && nullToAbsent
          ? const Value.absent()
          : Value(adjustmentDirection),
      reason: reason == null && nullToAbsent
          ? const Value.absent()
          : Value(reason),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TransactionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionRow(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      debtorId: serializer.fromJson<int>(json['debtorId']),
      type: $TransactionsTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      amount: serializer.fromJson<double>(json['amount']),
      date: serializer.fromJson<DateTime>(json['date']),
      description: serializer.fromJson<String?>(json['description']),
      attachmentPath: serializer.fromJson<String?>(json['attachmentPath']),
      adjustmentDirection: $TransactionsTable.$converteradjustmentDirectionn
          .fromJson(serializer.fromJson<int?>(json['adjustmentDirection'])),
      reason: serializer.fromJson<String?>(json['reason']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'debtorId': serializer.toJson<int>(debtorId),
      'type': serializer.toJson<int>(
        $TransactionsTable.$convertertype.toJson(type),
      ),
      'amount': serializer.toJson<double>(amount),
      'date': serializer.toJson<DateTime>(date),
      'description': serializer.toJson<String?>(description),
      'attachmentPath': serializer.toJson<String?>(attachmentPath),
      'adjustmentDirection': serializer.toJson<int?>(
        $TransactionsTable.$converteradjustmentDirectionn.toJson(
          adjustmentDirection,
        ),
      ),
      'reason': serializer.toJson<String?>(reason),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TransactionRow copyWith({
    int? id,
    String? uuid,
    int? debtorId,
    TransactionTypeColumn? type,
    double? amount,
    DateTime? date,
    Value<String?> description = const Value.absent(),
    Value<String?> attachmentPath = const Value.absent(),
    Value<AdjustmentDirectionColumn?> adjustmentDirection =
        const Value.absent(),
    Value<String?> reason = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => TransactionRow(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    debtorId: debtorId ?? this.debtorId,
    type: type ?? this.type,
    amount: amount ?? this.amount,
    date: date ?? this.date,
    description: description.present ? description.value : this.description,
    attachmentPath: attachmentPath.present
        ? attachmentPath.value
        : this.attachmentPath,
    adjustmentDirection: adjustmentDirection.present
        ? adjustmentDirection.value
        : this.adjustmentDirection,
    reason: reason.present ? reason.value : this.reason,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  TransactionRow copyWithCompanion(TransactionsCompanion data) {
    return TransactionRow(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      debtorId: data.debtorId.present ? data.debtorId.value : this.debtorId,
      type: data.type.present ? data.type.value : this.type,
      amount: data.amount.present ? data.amount.value : this.amount,
      date: data.date.present ? data.date.value : this.date,
      description: data.description.present
          ? data.description.value
          : this.description,
      attachmentPath: data.attachmentPath.present
          ? data.attachmentPath.value
          : this.attachmentPath,
      adjustmentDirection: data.adjustmentDirection.present
          ? data.adjustmentDirection.value
          : this.adjustmentDirection,
      reason: data.reason.present ? data.reason.value : this.reason,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRow(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('debtorId: $debtorId, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('description: $description, ')
          ..write('attachmentPath: $attachmentPath, ')
          ..write('adjustmentDirection: $adjustmentDirection, ')
          ..write('reason: $reason, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionRow &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.debtorId == this.debtorId &&
          other.type == this.type &&
          other.amount == this.amount &&
          other.date == this.date &&
          other.description == this.description &&
          other.attachmentPath == this.attachmentPath &&
          other.adjustmentDirection == this.adjustmentDirection &&
          other.reason == this.reason &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TransactionsCompanion extends UpdateCompanion<TransactionRow> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<int> debtorId;
  final Value<TransactionTypeColumn> type;
  final Value<double> amount;
  final Value<DateTime> date;
  final Value<String?> description;
  final Value<String?> attachmentPath;
  final Value<AdjustmentDirectionColumn?> adjustmentDirection;
  final Value<String?> reason;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.debtorId = const Value.absent(),
    this.type = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
    this.description = const Value.absent(),
    this.attachmentPath = const Value.absent(),
    this.adjustmentDirection = const Value.absent(),
    this.reason = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required int debtorId,
    required TransactionTypeColumn type,
    required double amount,
    required DateTime date,
    this.description = const Value.absent(),
    this.attachmentPath = const Value.absent(),
    this.adjustmentDirection = const Value.absent(),
    this.reason = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : uuid = Value(uuid),
       debtorId = Value(debtorId),
       type = Value(type),
       amount = Value(amount),
       date = Value(date);
  static Insertable<TransactionRow> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<int>? debtorId,
    Expression<int>? type,
    Expression<double>? amount,
    Expression<DateTime>? date,
    Expression<String>? description,
    Expression<String>? attachmentPath,
    Expression<int>? adjustmentDirection,
    Expression<String>? reason,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (debtorId != null) 'debtor_id': debtorId,
      if (type != null) 'type': type,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
      if (description != null) 'description': description,
      if (attachmentPath != null) 'attachment_path': attachmentPath,
      if (adjustmentDirection != null)
        'adjustment_direction': adjustmentDirection,
      if (reason != null) 'reason': reason,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TransactionsCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<int>? debtorId,
    Value<TransactionTypeColumn>? type,
    Value<double>? amount,
    Value<DateTime>? date,
    Value<String?>? description,
    Value<String?>? attachmentPath,
    Value<AdjustmentDirectionColumn?>? adjustmentDirection,
    Value<String?>? reason,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return TransactionsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      debtorId: debtorId ?? this.debtorId,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      description: description ?? this.description,
      attachmentPath: attachmentPath ?? this.attachmentPath,
      adjustmentDirection: adjustmentDirection ?? this.adjustmentDirection,
      reason: reason ?? this.reason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (debtorId.present) {
      map['debtor_id'] = Variable<int>(debtorId.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $TransactionsTable.$convertertype.toSql(type.value),
      );
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (attachmentPath.present) {
      map['attachment_path'] = Variable<String>(attachmentPath.value);
    }
    if (adjustmentDirection.present) {
      map['adjustment_direction'] = Variable<int>(
        $TransactionsTable.$converteradjustmentDirectionn.toSql(
          adjustmentDirection.value,
        ),
      );
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('debtorId: $debtorId, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('description: $description, ')
          ..write('attachmentPath: $attachmentPath, ')
          ..write('adjustmentDirection: $adjustmentDirection, ')
          ..write('reason: $reason, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DebtorsTable debtors = $DebtorsTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final DebtorDao debtorDao = DebtorDao(this as AppDatabase);
  late final TransactionDao transactionDao = TransactionDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [debtors, transactions];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'debtors',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('transactions', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$DebtorsTableCreateCompanionBuilder =
    DebtorsCompanion Function({
      Value<int> id,
      required String uuid,
      required String fullName,
      Value<String?> nickname,
      Value<String?> mobile,
      Value<String?> address,
      Value<String?> notes,
      Value<String?> photoPath,
      Value<DateTime> dateAdded,
      Value<bool> isArchived,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$DebtorsTableUpdateCompanionBuilder =
    DebtorsCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<String> fullName,
      Value<String?> nickname,
      Value<String?> mobile,
      Value<String?> address,
      Value<String?> notes,
      Value<String?> photoPath,
      Value<DateTime> dateAdded,
      Value<bool> isArchived,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$DebtorsTableReferences
    extends BaseReferences<_$AppDatabase, $DebtorsTable, DebtorRow> {
  $$DebtorsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TransactionsTable, List<TransactionRow>>
  _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: $_aliasNameGenerator(db.debtors.id, db.transactions.debtorId),
  );

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.debtorId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DebtorsTableFilterComposer
    extends Composer<_$AppDatabase, $DebtorsTable> {
  $$DebtorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mobile => $composableBuilder(
    column: $table.mobile,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> transactionsRefs(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.debtorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DebtorsTableOrderingComposer
    extends Composer<_$AppDatabase, $DebtorsTable> {
  $$DebtorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mobile => $composableBuilder(
    column: $table.mobile,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DebtorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DebtorsTable> {
  $$DebtorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get nickname =>
      $composableBuilder(column: $table.nickname, builder: (column) => column);

  GeneratedColumn<String> get mobile =>
      $composableBuilder(column: $table.mobile, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<DateTime> get dateAdded =>
      $composableBuilder(column: $table.dateAdded, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> transactionsRefs<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.debtorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DebtorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DebtorsTable,
          DebtorRow,
          $$DebtorsTableFilterComposer,
          $$DebtorsTableOrderingComposer,
          $$DebtorsTableAnnotationComposer,
          $$DebtorsTableCreateCompanionBuilder,
          $$DebtorsTableUpdateCompanionBuilder,
          (DebtorRow, $$DebtorsTableReferences),
          DebtorRow,
          PrefetchHooks Function({bool transactionsRefs})
        > {
  $$DebtorsTableTableManager(_$AppDatabase db, $DebtorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DebtorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DebtorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DebtorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String?> nickname = const Value.absent(),
                Value<String?> mobile = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<DateTime> dateAdded = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DebtorsCompanion(
                id: id,
                uuid: uuid,
                fullName: fullName,
                nickname: nickname,
                mobile: mobile,
                address: address,
                notes: notes,
                photoPath: photoPath,
                dateAdded: dateAdded,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                required String fullName,
                Value<String?> nickname = const Value.absent(),
                Value<String?> mobile = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<DateTime> dateAdded = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DebtorsCompanion.insert(
                id: id,
                uuid: uuid,
                fullName: fullName,
                nickname: nickname,
                mobile: mobile,
                address: address,
                notes: notes,
                photoPath: photoPath,
                dateAdded: dateAdded,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DebtorsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({transactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (transactionsRefs) db.transactions],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionsRefs)
                    await $_getPrefetchedData<
                      DebtorRow,
                      $DebtorsTable,
                      TransactionRow
                    >(
                      currentTable: table,
                      referencedTable: $$DebtorsTableReferences
                          ._transactionsRefsTable(db),
                      managerFromTypedResult: (p0) => $$DebtorsTableReferences(
                        db,
                        table,
                        p0,
                      ).transactionsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.debtorId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DebtorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DebtorsTable,
      DebtorRow,
      $$DebtorsTableFilterComposer,
      $$DebtorsTableOrderingComposer,
      $$DebtorsTableAnnotationComposer,
      $$DebtorsTableCreateCompanionBuilder,
      $$DebtorsTableUpdateCompanionBuilder,
      (DebtorRow, $$DebtorsTableReferences),
      DebtorRow,
      PrefetchHooks Function({bool transactionsRefs})
    >;
typedef $$TransactionsTableCreateCompanionBuilder =
    TransactionsCompanion Function({
      Value<int> id,
      required String uuid,
      required int debtorId,
      required TransactionTypeColumn type,
      required double amount,
      required DateTime date,
      Value<String?> description,
      Value<String?> attachmentPath,
      Value<AdjustmentDirectionColumn?> adjustmentDirection,
      Value<String?> reason,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$TransactionsTableUpdateCompanionBuilder =
    TransactionsCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<int> debtorId,
      Value<TransactionTypeColumn> type,
      Value<double> amount,
      Value<DateTime> date,
      Value<String?> description,
      Value<String?> attachmentPath,
      Value<AdjustmentDirectionColumn?> adjustmentDirection,
      Value<String?> reason,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$TransactionsTableReferences
    extends BaseReferences<_$AppDatabase, $TransactionsTable, TransactionRow> {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DebtorsTable _debtorIdTable(_$AppDatabase db) =>
      db.debtors.createAlias(
        $_aliasNameGenerator(db.transactions.debtorId, db.debtors.id),
      );

  $$DebtorsTableProcessedTableManager get debtorId {
    final $_column = $_itemColumn<int>('debtor_id')!;

    final manager = $$DebtorsTableTableManager(
      $_db,
      $_db.debtors,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_debtorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    TransactionTypeColumn,
    TransactionTypeColumn,
    int
  >
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attachmentPath => $composableBuilder(
    column: $table.attachmentPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    AdjustmentDirectionColumn?,
    AdjustmentDirectionColumn,
    int
  >
  get adjustmentDirection => $composableBuilder(
    column: $table.adjustmentDirection,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DebtorsTableFilterComposer get debtorId {
    final $$DebtorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.debtorId,
      referencedTable: $db.debtors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtorsTableFilterComposer(
            $db: $db,
            $table: $db.debtors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attachmentPath => $composableBuilder(
    column: $table.attachmentPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get adjustmentDirection => $composableBuilder(
    column: $table.adjustmentDirection,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DebtorsTableOrderingComposer get debtorId {
    final $$DebtorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.debtorId,
      referencedTable: $db.debtors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtorsTableOrderingComposer(
            $db: $db,
            $table: $db.debtors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TransactionTypeColumn, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get attachmentPath => $composableBuilder(
    column: $table.attachmentPath,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<AdjustmentDirectionColumn?, int>
  get adjustmentDirection => $composableBuilder(
    column: $table.adjustmentDirection,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$DebtorsTableAnnotationComposer get debtorId {
    final $$DebtorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.debtorId,
      referencedTable: $db.debtors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtorsTableAnnotationComposer(
            $db: $db,
            $table: $db.debtors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionsTable,
          TransactionRow,
          $$TransactionsTableFilterComposer,
          $$TransactionsTableOrderingComposer,
          $$TransactionsTableAnnotationComposer,
          $$TransactionsTableCreateCompanionBuilder,
          $$TransactionsTableUpdateCompanionBuilder,
          (TransactionRow, $$TransactionsTableReferences),
          TransactionRow,
          PrefetchHooks Function({bool debtorId})
        > {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<int> debtorId = const Value.absent(),
                Value<TransactionTypeColumn> type = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> attachmentPath = const Value.absent(),
                Value<AdjustmentDirectionColumn?> adjustmentDirection =
                    const Value.absent(),
                Value<String?> reason = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => TransactionsCompanion(
                id: id,
                uuid: uuid,
                debtorId: debtorId,
                type: type,
                amount: amount,
                date: date,
                description: description,
                attachmentPath: attachmentPath,
                adjustmentDirection: adjustmentDirection,
                reason: reason,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                required int debtorId,
                required TransactionTypeColumn type,
                required double amount,
                required DateTime date,
                Value<String?> description = const Value.absent(),
                Value<String?> attachmentPath = const Value.absent(),
                Value<AdjustmentDirectionColumn?> adjustmentDirection =
                    const Value.absent(),
                Value<String?> reason = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => TransactionsCompanion.insert(
                id: id,
                uuid: uuid,
                debtorId: debtorId,
                type: type,
                amount: amount,
                date: date,
                description: description,
                attachmentPath: attachmentPath,
                adjustmentDirection: adjustmentDirection,
                reason: reason,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransactionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({debtorId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (debtorId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.debtorId,
                                referencedTable: $$TransactionsTableReferences
                                    ._debtorIdTable(db),
                                referencedColumn: $$TransactionsTableReferences
                                    ._debtorIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionsTable,
      TransactionRow,
      $$TransactionsTableFilterComposer,
      $$TransactionsTableOrderingComposer,
      $$TransactionsTableAnnotationComposer,
      $$TransactionsTableCreateCompanionBuilder,
      $$TransactionsTableUpdateCompanionBuilder,
      (TransactionRow, $$TransactionsTableReferences),
      TransactionRow,
      PrefetchHooks Function({bool debtorId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DebtorsTableTableManager get debtors =>
      $$DebtorsTableTableManager(_db, _db.debtors);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
}
