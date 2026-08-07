import 'package:drift/drift.dart';

@DataClassName('DebtorRow')
class Debtors extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().withLength(min: 36, max: 36)();
  TextColumn get fullName => text().withLength(min: 1, max: 120)();
  TextColumn get nickname => text().withLength(max: 60).nullable()();
  TextColumn get mobile => text().withLength(max: 30).nullable()();
  TextColumn get address => text().withLength(max: 500).nullable()();
  TextColumn get notes => text().withLength(max: 2000).nullable()();
  TextColumn get photoPath => text().nullable()();
  DateTimeColumn get dateAdded => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {uuid},
      ];
}
