import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../providers/transaction_history_providers.dart';
import 'transaction_type_selector.dart';

Future<void> showTransactionFilterSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) => const _TransactionFilterSheet(),
  );
}

class _TransactionFilterSheet extends ConsumerWidget {
  const _TransactionFilterSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(globalTransactionFilterProvider);
    final notifier = ref.read(globalTransactionFilterProvider.notifier);
    final selectedTypes = filterState.types ?? <TransactionType>{};

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Filter by type', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              children: TransactionType.values.map((type) {
                final isSelected = selectedTypes.contains(type);
                return FilterChip(
                  label: Text(type.label),
                  avatar: Icon(type.icon, size: 16),
                  selected: isSelected,
                  onSelected: (selected) {
                    final updated = {...selectedTypes};
                    if (selected) {
                      updated.add(type);
                    } else {
                      updated.remove(type);
                    }
                    notifier.setTypes(updated.isEmpty ? null : updated);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: AppSpacing.md),
            TextButton(
              onPressed: () => notifier.setTypes(null),
              child: const Text('Clear filters'),
            ),
          ],
        ),
      ),
    );
  }
}
