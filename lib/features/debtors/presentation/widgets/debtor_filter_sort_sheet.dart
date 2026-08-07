import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../providers/debtor_list_providers.dart';

Future<void> showDebtorFilterSortSheet(BuildContext context, WidgetRef ref) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) => const _DebtorFilterSortSheet(),
  );
}

class _DebtorFilterSortSheet extends ConsumerWidget {
  const _DebtorFilterSortSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(debtorListFilterProvider);
    final notifier = ref.read(debtorListFilterProvider.notifier);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Filter', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              children: DebtorFilter.values.map((filter) {
                return ChoiceChip(
                  label: Text(_filterLabel(filter)),
                  selected: filterState.filter == filter,
                  onSelected: (_) => notifier.setFilter(filter),
                );
              }).toList(),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text('Sort by', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              children: DebtorSortBy.values.map((sortBy) {
                return ChoiceChip(
                  label: Text(_sortLabel(sortBy)),
                  selected: filterState.sortBy == sortBy,
                  onSelected: (_) => notifier.setSortBy(sortBy),
                );
              }).toList(),
            ),
            const SizedBox(height: AppSpacing.md),
            OutlinedButton.icon(
              onPressed: notifier.toggleOrder,
              icon: Icon(filterState.order == SortOrder.ascending
                  ? Icons.arrow_upward
                  : Icons.arrow_downward),
              label: Text(filterState.order == SortOrder.ascending ? 'Ascending' : 'Descending'),
            ),
          ],
        ),
      ),
    );
  }

  String _filterLabel(DebtorFilter filter) {
    switch (filter) {
      case DebtorFilter.all:
        return 'All';
      case DebtorFilter.active:
        return 'Active';
      case DebtorFilter.archived:
        return 'Archived';
    }
  }

  String _sortLabel(DebtorSortBy sortBy) {
    switch (sortBy) {
      case DebtorSortBy.name:
        return 'Name';
      case DebtorSortBy.dateAdded:
        return 'Date added';
      case DebtorSortBy.balance:
        return 'Balance';
      case DebtorSortBy.recentlyUpdated:
        return 'Recently updated';
    }
  }
}
