import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
              routes: [
                GoRoute(
                  path: 'detail/:debtorId',
                  builder: (context, state) => DebtorDetailScreen(
                    debtorId: int.parse(state.pathParameters['debtorId']!),
                  ),
                ),
                GoRoute(
                  path: 'add',
                  builder: (context, state) => const DebtorFormScreen(),
                ),
                GoRoute(
                  path: 'edit/:debtorId',
                  builder: (context, state) => DebtorFormScreen(
                    debtorId: int.parse(state.pathParameters['debtorId']!),
                  ),
                ),
              ],
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
              routes: [
                GoRoute(
                  path: 'outstanding',
                  builder: (context, state) => const OutstandingDebtsReportScreen(),
                ),
                GoRoute(
                  path: 'payments',
                  builder: (context, state) => const PaymentHistoryReportScreen(),
                ),
                GoRoute(
                  path: 'collection-summary',
                  builder: (context, state) => const CollectionSummaryReportScreen(),
                ),
                GoRoute(
                  path: 'monthly',
                  builder: (context, state) => const MonthlyCollectionsReportScreen(),
                ),
                GoRoute(
                  path: 'annual',
                  builder: (context, state) => const AnnualCollectionsReportScreen(),
                ),
              ],
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.settings,
              builder: (context, state) => const SettingsScreen(),
              routes: [
                GoRoute(
                  path: 'security',
                  builder: (context, state) => const SecuritySettingsScreen(),
                ),
                GoRoute(
                  path: 'appearance',
                  builder: (context, state) => const AppearanceSettingsScreen(),
                ),
              ],
            ),
          ]),
        ],
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
