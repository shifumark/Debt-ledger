import 'dart:io';

import '../../../../core/error/result.dart';
import '../repositories/backup_repository.dart';

class CreateBackup {
  const CreateBackup(this._repository);

  final BackupRepository _repository;

  Future<Result<File>> call() => _repository.createBackup();
}
