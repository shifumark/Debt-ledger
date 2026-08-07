import '../repositories/auth_repository.dart';

class SetAutoLockDuration {
  const SetAutoLockDuration(this._repository);

  final AuthRepository _repository;

  Future<void> call(Duration duration) => _repository.setAutoLockDuration(duration);
}
