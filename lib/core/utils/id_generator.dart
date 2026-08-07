import 'package:uuid/uuid.dart';

/// Thin wrapper so nothing outside this file imports `package:uuid` directly —
/// keeps the ID-generation strategy swappable in one place.
class IdGenerator {
  const IdGenerator._();

  static const Uuid _uuid = Uuid();

  static String generate() => _uuid.v4();
}
