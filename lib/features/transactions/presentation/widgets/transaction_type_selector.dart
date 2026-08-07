import 'package:flutter/material.dart';

import '../../../../shared/enums/shared_enums.dart';

class TransactionTypeSelector extends StatelessWidget {
  const TransactionTypeSelector({
    required this.selected,
    required this.onChanged,
    super.key,
  });

  final TransactionType selected;
  final ValueChanged<TransactionType> onChanged;

  @override
  Widget build(BuildContext context) {
    // A single-row SegmentedButton with 4 icon+label segments doesn't fit on
    // narrow screens (labels wrap letter-by-letter) — a wrapping chip row
    // scales down to however many segments fit per line instead.
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: TransactionType.values.map((type) {
        final isSelected = type == selected;
        return ChoiceChip(
          avatar: Icon(type.icon, size: 18),
          label: Text(type.label),
          selected: isSelected,
          onSelected: (_) => onChanged(type),
        );
      }).toList(),
    );
  }
}

extension TransactionTypeLabel on TransactionType {
  String get label {
    switch (this) {
      case TransactionType.loan:
        return 'Loan';
      case TransactionType.payment:
        return 'Payment';
      case TransactionType.adjustment:
        return 'Adjustment';
      case TransactionType.forgiveness:
        return 'Forgiveness';
    }
  }

  IconData get icon {
    switch (this) {
      case TransactionType.loan:
        return Icons.north_east;
      case TransactionType.payment:
        return Icons.south_west;
      case TransactionType.adjustment:
        return Icons.tune;
      case TransactionType.forgiveness:
        return Icons.volunteer_activism_outlined;
    }
  }
}
