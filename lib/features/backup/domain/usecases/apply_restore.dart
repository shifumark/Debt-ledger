import '../../../../core/error/result.dart';
import '../entities/pending_restore.dart';
import '../repositories/backup_repository.dart';

class ApplyRestore {
  const ApplyRestore(this._repository);

  final BackupRepository _repository;

  Future<Result<void>> call(PendingRestore pending) => _repository.applyRestore(pending);
}
