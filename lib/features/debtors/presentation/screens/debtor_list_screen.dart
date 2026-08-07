import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../providers/debtor_list_providers.dart';
import '../widgets/debtor_filter_sort_sheet.dart';
import '../widgets/debtor_list_tile.dart';

class DebtorListScreen extends ConsumerWidget {
  const DebtorListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debtorsAsync = ref.watch(debtorListWithBalancesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Debtors'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => context.push(AppRoutes.search),
          ),
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () => showDebtorFilterSortSheet(context, ref),
          ),
        ],
      ),
      body: AppScaffold(
        child: debtorsAsync.when(
          loading: () => const LoadingIndicator(),
          error: (error, _) => ErrorView(
            message: error.toString(),
            onRetry: () => ref.invalidate(debtorListWithBalancesProvider),
          ),
          data: (debtors) {
            if (debtors.isEmpty) {
              return const EmptyState(
                icon: Icons.people_outline,
                title: 'No debtors yet',
                message: 'Tap the + button to add your first debtor.',
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: debtors.length,
              separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, index) {
                final item = debtors[index];
                return DebtorListTile(
                  debtor: item.debtor,
                  balance: item.balance,
                  onTap: () => context.push('${AppRoutes.debtorDetail}/${item.debtor.id}'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
