import 'package:flutter/material.dart';

import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../../domain/entities/debt_transaction.dart';
import 'transaction_type_selector.dart';

/// True when the transaction increases how much the debtor owes (bad news
/// for the creditor's cash position); false when it decreases it.
bool transactionIncreasesBalance(DebtTransaction transaction) {
  switch (transaction.type) {
    case TransactionType.loan:
      return true;
    case TransactionType.payment:
      return false;
    case TransactionType.forgiveness:
      return false;
    case TransactionType.adjustment:
      return transaction.adjustmentDirection == AdjustmentDirection.increase;
  }
}

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({
    required this.transaction,
    this.debtorName,
    this.onTap,
    super.key,
  });

  final DebtTransaction transaction;
  final String? debtorName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final increases = transactionIncreasesBalance(transaction);
    final amountColor = increases ? colorScheme.error : colorScheme.primary;
    final sign = increases ? '+' : '-';
    final subtitle = [
      if (debtorName != null) debtorName,
      transaction.description ?? transaction.reason,
    ].whereType<String>().where((s) => s.isNotEmpty).join(' · ');

    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: amountColor.withValues(alpha: 0.12),
          child: Icon(transaction.type.icon, color: amountColor, size: 20),
        ),
        title: Text(transaction.type.label),
        subtitle: subtitle.isEmpty ? null : Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$sign${CurrencyFormatter.format(transaction.amount)}',
              style: TextStyle(color: amountColor, fontWeight: FontWeight.w600),
            ),
            Text(
              DateFormatter.dayMonth(transaction.date),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
