import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/daos/debtor_dao.dart';
import '../../../../core/providers/core_providers.dart';
import '../../data/datasources/debtor_local_datasource.dart';
import '../../data/repositories/debtor_repository_impl.dart';
import '../../domain/repositories/debtor_repository.dart';
import '../../domain/usecases/add_debtor.dart';
import '../../domain/usecases/archive_debtor.dart';
import '../../domain/usecases/get_debtor_by_id.dart';
import '../../domain/usecases/search_debtors.dart';
import '../../domain/usecases/update_debtor.dart';
import '../../domain/usecases/watch_debtors.dart';

part 'debtor_providers.g.dart';

@riverpod
Future<DebtorDao> debtorDao(Ref ref) async {
  final db = await ref.watch(appDatabaseInstanceProvider.future);
  return db.debtorDao;
}

@riverpod
Future<DebtorRepository> debtorRepository(Ref ref) async {
  final dao = await ref.watch(debtorDaoProvider.future);
  return DebtorRepositoryImpl(DebtorLocalDataSourceImpl(dao));
}

@riverpod
Future<AddDebtor> addDebtorUseCase(Ref ref) async =>
    AddDebtor(await ref.watch(debtorRepositoryProvider.future));

@riverpod
Future<UpdateDebtor> updateDebtorUseCase(Ref ref) async =>
    UpdateDebtor(await ref.watch(debtorRepositoryProvider.future));

@riverpod
Future<ArchiveDebtor> archiveDebtorUseCase(Ref ref) async =>
    ArchiveDebtor(await ref.watch(debtorRepositoryProvider.future));

@riverpod
Future<GetDebtorById> getDebtorByIdUseCase(Ref ref) async =>
    GetDebtorById(await ref.watch(debtorRepositoryProvider.future));

@riverpod
Future<WatchDebtors> watchDebtorsUseCase(Ref ref) async =>
    WatchDebtors(await ref.watch(debtorRepositoryProvider.future));

@riverpod
Future<SearchDebtors> searchDebtorsUseCase(Ref ref) async =>
    SearchDebtors(await ref.watch(debtorRepositoryProvider.future));
