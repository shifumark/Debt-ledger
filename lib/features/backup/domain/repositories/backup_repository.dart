import 'dart:io';

import '../../../../core/error/result.dart';
import '../entities/pending_restore.dart';

abstract class BackupRepository {
  /// Creates a full backup (encrypted database + debtor photos + manifest)
  /// bundled as a single .zip in a temporary location, ready to share.
  Future<Result<File>> createBackup();

  /// Same as [createBackup] but writes into the app's internal storage
  /// (not a shareable temp file) — used by the silent automatic backup.
  Future<Result<File>> createInternalBackup();

  /// Extracts and validates [backupZip] without touching the live database.
  /// Caller must show [PendingRestore.manifest] to the user for confirmation
  /// before calling [applyRestore].
  Future<Result<PendingRestore>> prepareRestore(File backupZip);

  /// Replaces the live database and debtor photos with the contents of
  /// [pending]. The caller MUST have fully closed the live database
  /// connection before calling this — it does not manage that lifecycle
  /// itself (that's a Riverpod-provider concern, kept out of this layer).
  Future<Result<void>> applyRestore(PendingRestore pending);

  Future<void> cleanupPendingRestore(PendingRestore pending);

  /// Deletes internal automatic backups beyond the most recent [keep].
  Future<void> pruneInternalBackups({int keep});
}
