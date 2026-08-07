import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

class ScaffoldWithNav extends StatelessWidget {
  const ScaffoldWithNav({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  static const _quickActionTabs = {0, 1, 2};

  @override
  Widget build(BuildContext context) {
    final showFab = _quickActionTabs.contains(navigationShell.currentIndex);
    return Scaffold(
      body: navigationShell,
      floatingActionButton: showFab
          ? FloatingActionButton(
              onPressed: () => _showQuickActions(context),
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.people_outline), selectedIcon: Icon(Icons.people), label: 'Debtors'),
          NavigationDestination(icon: Icon(Icons.receipt_long_outlined), selectedIcon: Icon(Icons.receipt_long), label: 'Transactions'),
          NavigationDestination(icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart), label: 'Reports'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  void _showQuickActions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.person_add_outlined),
              title: const Text('Add Debtor'),
              onTap: () {
                Navigator.of(sheetContext).pop();
                sheetContext.push(AppRoutes.debtorAdd);
              },
            ),
            ListTile(
              leading: const Icon(Icons.north_east),
              title: const Text('Record Loan'),
              onTap: () {
                Navigator.of(sheetContext).pop();
                sheetContext.push('${AppRoutes.addTransaction}?type=loan');
              },
            ),
            ListTile(
              leading: const Icon(Icons.south_west),
              title: const Text('Record Payment'),
              onTap: () {
                Navigator.of(sheetContext).pop();
                sheetContext.push('${AppRoutes.addTransaction}?type=payment');
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
