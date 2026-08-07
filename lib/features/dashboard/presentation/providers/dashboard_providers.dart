import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../debtors/presentation/providers/debtor_providers.dart';
import '../../../transactions/presentation/providers/transaction_providers.dart';
import '../../domain/entities/dashboard_summary.dart';
import '../../domain/usecases/get_dashboard_summary.dart';

part 'dashboard_providers.g.dart';

@riverpod
Future<GetDashboardSummary> getDashboardSummaryUseCase(Ref ref) async {
  final debtorRepository = await ref.watch(debtorRepositoryProvider.future);
  final transactionRepository = await ref.watch(transactionRepositoryProvider.future);
  return GetDashboardSummary(debtorRepository, transactionRepository);
}

@riverpod
Stream<DashboardSummary> dashboardSummary(Ref ref) async* {
  final useCase = await ref.watch(getDashboardSummaryUseCaseProvider.future);
  yield* useCase.watch();
}
