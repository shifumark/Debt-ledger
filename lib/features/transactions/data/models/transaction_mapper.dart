import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/tables/transactions_table.dart';
import '../../../../core/utils/id_generator.dart';
import '../../../../shared/enums/shared_enums.dart' as domain;
import '../../domain/entities/debt_transaction.dart';

class TransactionMapper {
  const TransactionMapper._();

  static DebtTransaction toEntity(TransactionRow row) => DebtTransaction(
        id: row.id,
        uuid: row.uuid,
        debtorId: row.debtorId,
        type: _toDomainType(row.type),
        amount: row.amount,
        date: row.date,
        description: row.description,
        attachmentPath: row.attachmentPath,
        adjustmentDirection: row.adjustmentDirection == null
            ? null
            : _toDomainDirection(row.adjustmentDirection!),
        reason: row.reason,
      );

  static TransactionsCompanion toInsertCompanion(TransactionInput input) =>
      TransactionsCompanion.insert(
        uuid: IdGenerator.generate(),
        debtorId: input.debtorId,
        type: _toColumnType(input.type),
        amount: input.amount,
        date: input.date,
        description: Value(input.description),
        attachmentPath: Value(input.attachmentPath),
        adjustmentDirection: Value(
          input.adjustmentDirection == null ? null : _toColumnDirection(input.adjustmentDirection!),
        ),
        reason: Value(input.reason),
      );

  static TransactionsCompanion toUpdateCompanion(TransactionRow existing, TransactionInput input) =>
      TransactionsCompanion(
        id: Value(existing.id),
        uuid: Value(existing.uuid),
        debtorId: Value(input.debtorId),
        type: Value(_toColumnType(input.type)),
        amount: Value(input.amount),
        date: Value(input.date),
        description: Value(input.description),
        attachmentPath: Value(input.attachmentPath),
        adjustmentDirection: Value(
          input.adjustmentDirection == null ? null : _toColumnDirection(input.adjustmentDirection!),
        ),
        reason: Value(input.reason),
        createdAt: Value(existing.createdAt),
        updatedAt: Value(DateTime.now()),
      );

  static TransactionTypeColumn toColumnType(domain.TransactionType type) => _toColumnType(type);

  static domain.TransactionType _toDomainType(TransactionTypeColumn column) {
    switch (column) {
      case TransactionTypeColumn.loan:
        return domain.TransactionType.loan;
      case TransactionTypeColumn.payment:
        return domain.TransactionType.payment;
      case TransactionTypeColumn.adjustment:
        return domain.TransactionType.adjustment;
      case TransactionTypeColumn.forgiveness:
        return domain.TransactionType.forgiveness;
    }
  }

  static TransactionTypeColumn _toColumnType(domain.TransactionType type) {
    switch (type) {
      case domain.TransactionType.loan:
        return TransactionTypeColumn.loan;
      case domain.TransactionType.payment:
        return TransactionTypeColumn.payment;
      case domain.TransactionType.adjustment:
        return TransactionTypeColumn.adjustment;
      case domain.TransactionType.forgiveness:
        return TransactionTypeColumn.forgiveness;
    }
  }

  static domain.AdjustmentDirection _toDomainDirection(AdjustmentDirectionColumn column) {
    switch (column) {
      case AdjustmentDirectionColumn.increase:
        return domain.AdjustmentDirection.increase;
      case AdjustmentDirectionColumn.decrease:
        return domain.AdjustmentDirection.decrease;
    }
  }

  static AdjustmentDirectionColumn _toColumnDirection(domain.AdjustmentDirection direction) {
    switch (direction) {
      case domain.AdjustmentDirection.increase:
        return AdjustmentDirectionColumn.increase;
      case domain.AdjustmentDirection.decrease:
        return AdjustmentDirectionColumn.decrease;
    }
  }
}
