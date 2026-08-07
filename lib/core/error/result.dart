import 'package:fpdart/fpdart.dart';

import 'failures.dart';

/// Standard return type for repository and use-case calls that can fail.
/// Left = failure, Right = success value.
typedef Result<T> = Either<Failure, T>;

Result<T> resultSuccess<T>(T value) => Right(value);
Result<T> resultFailure<T>(Failure failure) => Left(failure);
