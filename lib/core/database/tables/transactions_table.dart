import 'package:drift/drift.dart';

import 'debtors_table.dart';

/// Persisted transaction kind. Order matters — Drift stores the enum index,
/// never reorder or remove existing values; only append.
enum TransactionTypeColumn { loan, payment, adjustment, forgiveness }

/// Only meaningful when [TransactionTypeColumn.adjustment].
enum AdjustmentDirectionColumn { increase, decrease }

@DataClassName('TransactionRow')
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().withLength(min: 36, max: 36)();
  IntColumn get debtorId =>
      integer().references(Debtors, #id, onDelete: KeyAction.cascade)();
  IntColumn get type => intEnum<TransactionTypeColumn>()();
  RealColumn get amount => real()();
  DateTimeColumn get date => dateTime()();
  TextColumn get description => text().withLength(max: 500).nullable()();
  TextColumn get attachmentPath => text().nullable()();
  IntColumn get adjustmentDirection =>
      intEnum<AdjustmentDirectionColumn>().nullable()();
  TextColumn get reason => text().withLength(max: 500).nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {uuid},
      ];
}
