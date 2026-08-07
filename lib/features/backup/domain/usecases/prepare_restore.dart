import 'dart:io';

import '../../../../core/error/result.dart';
import '../entities/pending_restore.dart';
import '../repositories/backup_repository.dart';

class PrepareRestore {
  const PrepareRestore(this._repository);

  final BackupRepository _repository;

  Future<Result<PendingRestore>> call(File backupZip) => _repository.prepareRestore(backupZip);
}
