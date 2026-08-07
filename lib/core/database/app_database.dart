import 'package:drift/drift.dart';

import 'daos/debtor_dao.dart';
import 'daos/transaction_dao.dart';
import 'tables/debtors_table.dart';
import 'tables/transactions_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Debtors, Transactions],
  daos: [DebtorDao, TransactionDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await customStatement(
            'CREATE INDEX idx_transactions_debtor_date ON transactions(debtor_id, date DESC);',
          );
          await customStatement(
            'CREATE INDEX idx_transactions_date ON transactions(date DESC);',
          );
          await customStatement(
            'CREATE INDEX idx_debtors_archived_name ON debtors(is_archived, full_name COLLATE NOCASE);',
          );
          await customStatement(
            'CREATE INDEX idx_debtors_full_name_nocase ON debtors(full_name COLLATE NOCASE);',
          );
        },
      );
}
