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
    return SegmentedButton<TransactionType>(
      segments: const [
        ButtonSegment(value: TransactionType.loan, label: Text('Loan'), icon: Icon(Icons.north_east)),
        ButtonSegment(value: TransactionType.payment, label: Text('Payment'), icon: Icon(Icons.south_west)),
        ButtonSegment(value: TransactionType.adjustment, label: Text('Adjust'), icon: Icon(Icons.tune)),
        ButtonSegment(value: TransactionType.forgiveness, label: Text('Forgive'), icon: Icon(Icons.volunteer_activism_outlined)),
      ],
      selected: {selected},
      onSelectionChanged: (values) => onChanged(values.first),
      showSelectedIcon: false,
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
