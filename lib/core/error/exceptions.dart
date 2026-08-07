/// Thrown by the data layer; always caught at the repository boundary and
/// mapped into a [Failure] before crossing into the domain layer.
class DatabaseException implements Exception {
  const DatabaseException(this.message);
  final String message;

  @override
  String toString() => 'DatabaseException: $message';
}

class NotFoundException implements Exception {
  const NotFoundException(this.message);
  final String message;

  @override
  String toString() => 'NotFoundException: $message';
}

class SecurityException implements Exception {
  const SecurityException(this.message);
  final String message;

  @override
  String toString() => 'SecurityException: $message';
}
