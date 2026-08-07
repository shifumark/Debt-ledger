import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../transactions/domain/entities/debt_transaction.dart';

part 'dashboard_summary.freezed.dart';

@freezed
class DashboardSummary with _$DashboardSummary {
  const factory DashboardSummary({
    required double totalOutstanding,
    required double totalLent,
    required double totalReceived,
    required int totalDebtors,
    required int activeDebtors,
    required int fullyPaidDebtors,
    required double largestOutstandingBalance,
    String? largestOutstandingDebtorName,
    required List<DebtTransaction> recentTransactions,
  }) = _DashboardSummary;
}
