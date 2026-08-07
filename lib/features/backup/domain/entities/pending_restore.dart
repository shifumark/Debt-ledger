import 'dart:io';

import 'backup_manifest.dart';

/// A backup that has been extracted and validated but not yet applied —
/// the presentation layer shows [manifest] to the user for confirmation
/// before the destructive file swap in [BackupRepository.applyRestore] runs.
class PendingRestore {
  const PendingRestore({required this.manifest, required this.extractedDir});

  final BackupManifest manifest;
  final Directory extractedDir;
}
