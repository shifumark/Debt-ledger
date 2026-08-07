import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/utils/id_generator.dart';
import '../../domain/entities/debtor.dart';

class DebtorMapper {
  const DebtorMapper._();

  static Debtor toEntity(DebtorRow row) => Debtor(
        id: row.id,
        uuid: row.uuid,
        fullName: row.fullName,
        nickname: row.nickname,
        mobile: row.mobile,
        address: row.address,
        notes: row.notes,
        photoPath: row.photoPath,
        dateAdded: row.dateAdded,
        isArchived: row.isArchived,
      );

  static DebtorsCompanion toInsertCompanion(DebtorInput input) => DebtorsCompanion.insert(
        uuid: IdGenerator.generate(),
        fullName: input.fullName,
        nickname: Value(input.nickname),
        mobile: Value(input.mobile),
        address: Value(input.address),
        notes: Value(input.notes),
        photoPath: Value(input.photoPath),
      );

  static DebtorsCompanion toUpdateCompanion(DebtorRow existing, DebtorInput input) =>
      DebtorsCompanion(
        id: Value(existing.id),
        uuid: Value(existing.uuid),
        fullName: Value(input.fullName),
        nickname: Value(input.nickname),
        mobile: Value(input.mobile),
        address: Value(input.address),
        notes: Value(input.notes),
        photoPath: Value(input.photoPath),
        dateAdded: Value(existing.dateAdded),
        isArchived: Value(existing.isArchived),
        updatedAt: Value(DateTime.now()),
      );
}
