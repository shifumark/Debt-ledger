import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/backup/presentation/screens/backup_settings_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/debtors/presentation/screens/debtor_detail_screen.dart';
import '../../features/debtors/presentation/screens/debtor_form_screen.dart';
import '../../features/debtors/presentation/screens/debtor_list_screen.dart';
import '../../features/reports/presentation/screens/annual_collections_report_screen.dart';
import '../../features/reports/presentation/screens/collection_summary_report_screen.dart';
import '../../features/reports/presentation/screens/monthly_collections_report_screen.dart';
import '../../features/reports/presentation/screens/outstanding_debts_report_screen.dart';
import '../../features/reports/presentation/screens/payment_history_report_screen.dart';
import '../../features/reports/presentation/screens/reports_screen.dart';
import '../../features/search/presentation/screens/search_screen.dart';
import '../../features/settings/presentation/screens/appearance_settings_screen.dart';
import '../../features/settings/presentation/screens/security_settings_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/transactions/presentation/screens/add_transaction_screen.dart';
import '../../features/transactions/presentation/screens/transaction_history_screen.dart';
import 'app_routes.dart';
import 'scaffold_with_nav.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoutes.dashboard,
    routes: [
      // Only the 5 tab-root screens live inside the shell's branches — a
      // route nested under a branch pushes onto that branch's own Navigator,
      // which renders *inside* ScaffoldWithNav's body, leaving the bottom
      // nav bar and FAB visible on top of it. Every full-screen destination
      // below (detail/add/edit/settings sub-pages/report pages) is
      // deliberately a top-level route instead, so it covers the shell
      // entirely like a normal full-screen push.
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => ScaffoldWithNav(navigationShell: shell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.dashboard,
              builder: (context, state) => const DashboardScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.debtors,
              builder: (context, state) => const DebtorListScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.transactions,
              builder: (context, state) => const TransactionHistoryScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.reports,
              builder: (context, state) => const ReportsScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.settings,
              builder: (context, state) => const SettingsScreen(),
            ),
          ]),
        ],
      ),
      GoRoute(
        path: '${AppRoutes.debtorDetail}/:debtorId',
        builder: (context, state) => DebtorDetailScreen(
          debtorId: int.parse(state.pathParameters['debtorId']!),
        ),
      ),
      GoRoute(
        path: AppRoutes.debtorAdd,
        builder: (context, state) => const DebtorFormScreen(),
      ),
      GoRoute(
        path: '${AppRoutes.debtorEdit}/:debtorId',
        builder: (context, state) => DebtorFormScreen(
          debtorId: int.parse(state.pathParameters['debtorId']!),
        ),
      ),
      GoRoute(
        path: AppRoutes.reportOutstandingDebts,
        builder: (context, state) => const OutstandingDebtsReportScreen(),
      ),
      GoRoute(
        path: AppRoutes.reportPaymentHistory,
        builder: (context, state) => const PaymentHistoryReportScreen(),
      ),
      GoRoute(
        path: AppRoutes.reportCollectionSummary,
        builder: (context, state) => const CollectionSummaryReportScreen(),
      ),
      GoRoute(
        path: AppRoutes.reportMonthlyCollections,
        builder: (context, state) => const MonthlyCollectionsReportScreen(),
      ),
      GoRoute(
        path: AppRoutes.reportAnnualCollections,
        builder: (context, state) => const AnnualCollectionsReportScreen(),
      ),
      GoRoute(
        path: AppRoutes.settingsSecurity,
        builder: (context, state) => const SecuritySettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.settingsAppearance,
        builder: (context, state) => const AppearanceSettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.settingsBackup,
        builder: (context, state) => const BackupSettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.addTransaction,
        builder: (context, state) => AddTransactionScreen(
          debtorId: int.tryParse(state.uri.queryParameters['debtorId'] ?? ''),
          initialType: state.uri.queryParameters['type'],
        ),
      ),
      GoRoute(
        path: AppRoutes.search,
        builder: (context, state) => const SearchScreen(),
      ),
    ],
  );
}
