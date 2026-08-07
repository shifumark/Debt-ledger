import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Base failure type surfaced from the domain layer to the presentation layer.
/// Data-layer exceptions are always caught and mapped into one of these.
@freezed
sealed class Failure with _$Failure {
  const factory Failure.validation(String message) = ValidationFailure;
  const factory Failure.notFound(String message) = NotFoundFailure;
  const factory Failure.database(String message) = DatabaseFailure;
  const factory Failure.security(String message) = SecurityFailure;
  const factory Failure.unexpected(String message) = UnexpectedFailure;
}

extension FailureMessage on Failure {
  String get displayMessage => when(
        validation: (m) => m,
        notFound: (m) => m,
        database: (_) => 'A database error occurred. Please try again.',
        security: (m) => m,
        unexpected: (_) => 'Something went wrong. Please try again.',
      );
}
