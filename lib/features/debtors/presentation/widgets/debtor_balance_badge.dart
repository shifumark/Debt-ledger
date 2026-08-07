import 'package:flutter/material.dart';

import '../../../../core/utils/currency_formatter.dart';

class DebtorBalanceBadge extends StatelessWidget {
  const DebtorBalanceBadge({required this.balance, super.key});

  final double balance;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isSettled = balance <= 0;
    final color = isSettled ? colorScheme.primary : colorScheme.error;
    final background = isSettled
        ? colorScheme.primaryContainer
        : colorScheme.errorContainer;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        isSettled ? 'Paid' : CurrencyFormatter.format(balance),
        style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 13),
      ),
    );
  }
}
