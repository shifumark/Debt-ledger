import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/providers/core_providers.dart';
import '../../data/backup_repository_impl.dart';
import '../../domain/entities/pending_restore.dart';
import '../../domain/repositories/backup_repository.dart';
import '../../domain/usecases/apply_restore.dart';
import '../../domain/usecases/create_backup.dart';
import '../../domain/usecases/prepare_restore.dart';

part 'backup_providers.g.dart';

const _prefsAutoBackupFrequencyKey = 'auto_backup_frequency_v1';
const _prefsLastAutoBackupAtKey = 'last_auto_backup_at_v1';

enum AutoBackupFrequency { off, daily, weekly }

/// Sync on purpose — constructing this must NOT force the database open.
/// [BackupRepositoryImpl] only resolves it lazily, and only for the backup
/// -creation methods; the restore flow closes the database first and must
/// never trigger a reopen before the file swap completes.
@riverpod
BackupRepository backupRepository(Ref ref) {
  return BackupRepositoryImpl(
    () => ref.read(appDatabaseInstanceProvider.future),
    ref.watch(dbKeyManagerProvider),
  );
}

@riverpod
CreateBackup createBackupUseCase(Ref ref) => CreateBackup(ref.watch(backupRepositoryProvider));

@riverpod
PrepareRestore prepareRestoreUseCase(Ref ref) =>
    PrepareRestore(ref.watch(backupRepositoryProvider));

@riverpod
ApplyRestore applyRestoreUseCase(Ref ref) => ApplyRestore(ref.watch(backupRepositoryProvider));

@Riverpod(keepAlive: true)
class AutoBackupFrequencySetting extends _$AutoBackupFrequencySetting {
  @override
  Future<AutoBackupFrequency> build() async {
    final prefs = await ref.watch(sharedPreferencesProvider.future);
    final raw = prefs.getString(_prefsAutoBackupFrequencyKey);
    return AutoBackupFrequency.values.firstWhere(
      (f) => f.name == raw,
      orElse: () => AutoBackupFrequency.off,
    );
  }

  Future<void> setFrequency(AutoBackupFrequency frequency) async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.setString(_prefsAutoBackupFrequencyKey, frequency.name);
    state = AsyncData(frequency);
  }
}

/// Fire-and-forget startup check: if automatic backup is enabled and due,
/// silently writes an internal backup and prunes old ones. Triggered once by
/// being watched (and its value ignored) from [DebtLedgerApp].
@riverpod
Future<void> autoBackupCheck(Ref ref) async {
  final frequency = await ref.watch(autoBackupFrequencySettingProvider.future);
  if (frequency == AutoBackupFrequency.off) return;

  final prefs = await ref.watch(sharedPreferencesProvider.future);
  final lastRaw = prefs.getString(_prefsLastAutoBackupAtKey);
  final last = lastRaw == null ? null : DateTime.tryParse(lastRaw);
  final threshold = frequency == AutoBackupFrequency.daily
      ? const Duration(days: 1)
      : const Duration(days: 7);

  if (last != null && DateTime.now().difference(last) < threshold) return;

  final repository = ref.watch(backupRepositoryProvider);
  final result = await repository.createInternalBackup();
  final succeeded = result.fold((_) => false, (_) => true);
  if (!succeeded) return;

  await prefs.setString(_prefsLastAutoBackupAtKey, DateTime.now().toIso8601String());
  await repository.pruneInternalBackups();
}

class BackupUiState {
  const BackupUiState({this.isBusy = false, this.pendingRestore, this.errorMessage});

  final bool isBusy;
  final PendingRestore? pendingRestore;
  final String? errorMessage;

  BackupUiState copyWith({
    bool? isBusy,
    PendingRestore? pendingRestore,
    bool clearPendingRestore = false,
    String? errorMessage,
    bool clearError = false,
  }) {
    return BackupUiState(
      isBusy: isBusy ?? this.isBusy,
      pendingRestore: clearPendingRestore ? null : (pendingRestore ?? this.pendingRestore),
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

@riverpod
class BackupController extends _$BackupController {
  @override
  BackupUiState build() => const BackupUiState();

  Future<File?> createAndReturnBackup() async {
    state = state.copyWith(isBusy: true, clearError: true);
    final useCase = ref.read(createBackupUseCaseProvider);
    final result = await useCase.call();
    state = state.copyWith(isBusy: false);
    return result.fold(
      (failure) {
        state = state.copyWith(errorMessage: failure.displayMessage);
        return null;
      },
      (file) => file,
    );
  }

  Future<void> pickAndPrepareRestore(File backupZip) async {
    state = state.copyWith(isBusy: true, clearError: true);
    final useCase = ref.read(prepareRestoreUseCaseProvider);
    final result = await useCase.call(backupZip);
    state = result.fold(
      (failure) => state.copyWith(isBusy: false, errorMessage: failure.displayMessage),
      (pending) => state.copyWith(isBusy: false, pendingRestore: pending),
    );
  }

  Future<void> cancelRestore() async {
    final pending = state.pendingRestore;
    if (pending != null) {
      await ref.read(backupRepositoryProvider).cleanupPendingRestore(pending);
    }
    state = state.copyWith(clearPendingRestore: true);
  }

  /// Closes the live database, swaps in the restored files, then reopens it.
  /// Returns true on success — the caller should refresh/pop to a fresh
  /// screen afterward since every previously loaded provider's data is stale.
  ///
  /// Deliberately does NOT use `ref.invalidate` to trigger the close: other
  /// tabs stay mounted in the bottom-nav's IndexedStack and actively watch
  /// this database provider, so invalidating it while they're still
  /// listening would make Riverpod eagerly reopen a connection immediately
  /// — racing with the file swap below. Instead we close the instance
  /// directly and only invalidate afterward, once it's safe to reopen.
  Future<bool> confirmRestore() async {
    final pending = state.pendingRestore;
    if (pending == null) return false;
    state = state.copyWith(isBusy: true, clearError: true);

    final db = await ref.read(appDatabaseInstanceProvider.future);
    await db.close();

    final useCase = ref.read(applyRestoreUseCaseProvider);
    final result = await useCase.call(pending);

    // Safe to reopen now — any watcher that rebuilds will read the restored
    // file. Eagerly await it so the UI reflects restored data immediately
    // rather than waiting for the next incidental watch.
    ref.invalidate(appDatabaseInstanceProvider);
    await ref.read(appDatabaseInstanceProvider.future);

    var succeeded = false;
    state = result.fold(
      (failure) => state.copyWith(
        isBusy: false,
        clearPendingRestore: true,
        errorMessage: failure.displayMessage,
      ),
      (_) {
        succeeded = true;
        return state.copyWith(isBusy: false, clearPendingRestore: true);
      },
    );
    return succeeded;
  }
}
