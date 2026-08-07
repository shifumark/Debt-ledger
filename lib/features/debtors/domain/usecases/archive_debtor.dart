import '../../../../core/error/result.dart';
import '../repositories/debtor_repository.dart';

class ArchiveDebtor {
  const ArchiveDebtor(this._repository);

  final DebtorRepository _repository;

  Future<Result<void>> call(int id, {required bool archived}) =>
      _repository.setArchived(id, archived: archived);
}
