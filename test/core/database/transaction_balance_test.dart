@TestOn('vm')
library;

import 'dart:ffi';
import 'dart:io';

import 'package:debt_ledger/core/database/app_database.dart';
import 'package:debt_ledger/core/database/tables/transactions_table.dart';
import 'package:debt_ledger/core/utils/id_generator.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/open.dart';

/// Exercises the indexed balance-aggregate query in [TransactionDao] against
/// a real (in-memory) SQLite engine — this SQL is the highest-risk piece of
/// the schema for the 100k-transaction performance target, so it's worth
/// verifying against a real engine rather than only mapper-level unit tests.
void main() {
  setUpAll(() {
    if (Platform.isWindows) {
      open.overrideFor(
        OperatingSystem.windows,
        () => DynamicLibrary.open('sqlite3.dll'),
      );
    }
  });

  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  Future<int> seedDebtor({String fullName = 'Jane Doe'}) async {
    return db.into(db.debtors).insert(DebtorsCompanion.insert(
          uuid: IdGenerator.generate(),
          fullName: fullName,
        ));
  }

  Future<void> insertTransaction(
    int debtorId,
    TransactionTypeColumn type,
    double amount, {
    AdjustmentDirectionColumn? direction,
    DateTime? date,
  }) async {
    await db.into(db.transactions).insert(TransactionsCompanion.insert(
          uuid: IdGenerator.generate(),
          debtorId: debtorId,
          type: type,
          amount: amount,
          date: date ?? DateTime(2026, 1, 1),
          adjustmentDirection: Value(direction),
        ));
  }

  test('loan increases balance', () async {
    final debtorId = await seedDebtor();
    await insertTransaction(debtorId, TransactionTypeColumn.loan, 500);

    final balance = await db.transactionDao.calculateBalance(debtorId);
    expect(balance, 500);
  });

  test('payment decreases balance', () async {
    final debtorId = await seedDebtor();
    await insertTransaction(debtorId, TransactionTypeColumn.loan, 500);
    await insertTransaction(debtorId, TransactionTypeColumn.payment, 200);

    final balance = await db.transactionDao.calculateBalance(debtorId);
    expect(balance, 300);
  });

  test('adjustment increase and decrease apply correct sign', () async {
    final debtorId = await seedDebtor();
    await insertTransaction(debtorId, TransactionTypeColumn.loan, 1000);
    await insertTransaction(
      debtorId,
      TransactionTypeColumn.adjustment,
      100,
      direction: AdjustmentDirectionColumn.increase,
    );
    await insertTransaction(
      debtorId,
      TransactionTypeColumn.adjustment,
      50,
      direction: AdjustmentDirectionColumn.decrease,
    );

    final balance = await db.transactionDao.calculateBalance(debtorId);
    expect(balance, 1050);
  });

  test('forgiveness decreases balance', () async {
    final debtorId = await seedDebtor();
    await insertTransaction(debtorId, TransactionTypeColumn.loan, 800);
    await insertTransaction(debtorId, TransactionTypeColumn.forgiveness, 300);

    final balance = await db.transactionDao.calculateBalance(debtorId);
    expect(balance, 500);
  });

  test('balance for debtor with no transactions is zero', () async {
    final debtorId = await seedDebtor();
    final balance = await db.transactionDao.calculateBalance(debtorId);
    expect(balance, 0);
  });

  test('balances are scoped per debtor', () async {
    final debtorA = await seedDebtor();
    final debtorB = await seedDebtor(fullName: 'John Roe');

    await insertTransaction(debtorA, TransactionTypeColumn.loan, 700);
    await insertTransaction(debtorB, TransactionTypeColumn.loan, 100);
    await insertTransaction(debtorB, TransactionTypeColumn.payment, 40);

    expect(await db.transactionDao.calculateBalance(debtorA), 700);
    expect(await db.transactionDao.calculateBalance(debtorB), 60);
  });

  test('dashboard aggregates sum outstanding, lent and received across debtors', () async {
    final debtorA = await seedDebtor();
    final debtorB = await seedDebtor(fullName: 'Sam Smith');

    await insertTransaction(debtorA, TransactionTypeColumn.loan, 500);
    await insertTransaction(debtorA, TransactionTypeColumn.payment, 100);
    await insertTransaction(debtorB, TransactionTypeColumn.loan, 300);

    final totals = await db.transactionDao.calculateDashboardTotals();
    expect(totals.totalLent, 800);
    expect(totals.totalReceived, 100);
    expect(totals.totalOutstanding, 700);
  });

  test('calculateTotalForgiven sums only forgiveness transactions', () async {
    final debtorId = await seedDebtor();
    await insertTransaction(debtorId, TransactionTypeColumn.loan, 900);
    await insertTransaction(debtorId, TransactionTypeColumn.forgiveness, 250);
    await insertTransaction(debtorId, TransactionTypeColumn.payment, 100);

    expect(await db.transactionDao.calculateTotalForgiven(), 250);
  });

  test('monthlyCollections groups payments by month within a year', () async {
    final debtorId = await seedDebtor();
    await insertTransaction(debtorId, TransactionTypeColumn.payment, 100,
        date: DateTime(2026, 1, 15));
    await insertTransaction(debtorId, TransactionTypeColumn.payment, 50,
        date: DateTime(2026, 1, 20));
    await insertTransaction(debtorId, TransactionTypeColumn.payment, 200,
        date: DateTime(2026, 3, 5));
    // Different year — must not be included.
    await insertTransaction(debtorId, TransactionTypeColumn.payment, 999,
        date: DateTime(2025, 1, 15));
    // A loan in the same month — must not be included (only payments count).
    await insertTransaction(debtorId, TransactionTypeColumn.loan, 500,
        date: DateTime(2026, 1, 10));

    final rows = await db.transactionDao.monthlyCollections(year: 2026);
    final byMonth = {for (final r in rows) r.month: r.total};

    expect(byMonth[1], 150);
    expect(byMonth[3], 200);
    expect(byMonth.containsKey(2), isFalse);
  });

  test('annualCollections groups payments by year', () async {
    final debtorId = await seedDebtor();
    await insertTransaction(debtorId, TransactionTypeColumn.payment, 100,
        date: DateTime(2025, 6, 1));
    await insertTransaction(debtorId, TransactionTypeColumn.payment, 300,
        date: DateTime(2026, 2, 1));
    await insertTransaction(debtorId, TransactionTypeColumn.payment, 50,
        date: DateTime(2026, 7, 1));

    final rows = await db.transactionDao.annualCollections();
    final byYear = {for (final r in rows) r.year: r.total};

    expect(byYear[2025], 100);
    expect(byYear[2026], 350);
  });

  test('availableTransactionYears returns distinct years descending', () async {
    final debtorId = await seedDebtor();
    await insertTransaction(debtorId, TransactionTypeColumn.loan, 100, date: DateTime(2024, 5, 1));
    await insertTransaction(debtorId, TransactionTypeColumn.loan, 100, date: DateTime(2026, 5, 1));
    await insertTransaction(debtorId, TransactionTypeColumn.loan, 100, date: DateTime(2025, 5, 1));

    final years = await db.transactionDao.availableTransactionYears();
    expect(years, [2026, 2025, 2024]);
  });
}
