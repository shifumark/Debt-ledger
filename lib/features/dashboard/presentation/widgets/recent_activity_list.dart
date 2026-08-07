import 'package:flutter/material.dart';

import '../../../../core/widgets/empty_state.dart';
import '../../../transactions/domain/entities/debt_transaction.dart';
import '../../../transactions/presentation/widgets/transaction_list_tile.dart';

class RecentActivityList extends StatelessWidget {
  const RecentActivityList({required this.transactions, super.key});

  final List<DebtTransaction> transactions;

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return const EmptyState(
        icon: Icons.history,
        title: 'No activity yet',
        message: 'Recorded loans and payments will show up here.',
      );
    }
    return Column(
      children: transactions.map((t) => TransactionListTile(transaction: t)).toList(),
    );
  }
}
