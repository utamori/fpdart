import 'either.dart';
import 'option.dart';
import 'task.dart';
import 'task_either.dart';

/// `fpdart` extension to work on nullable values `T?`
extension FpdartOnNullable<T> on T? {
  /// Convert a nullable type `T?` to [Option]:
  /// - [Some] if the value is **not** `null`
  /// - [None] if the value is `null`
  Option<T> toOption() => Option.fromNullable(this);

  /// Convert a nullable type `T?` to [Either]:
  /// {@template fpdart_on_nullable_to_either}
  /// - [Right] if the value is **not** `null`
  /// - [Left] containing the result of `onNull` if the value is `null`
  /// {@endtemplate}
  Either<L, T> toEither<L>(L Function() onNull) =>
      Either.fromNullable(this, onNull);

  /// Convert a nullable type `T?` to [TaskEither] using a **sync function**:
  /// {@macro fpdart_on_nullable_to_either}
  ///
  /// If you want to run an **async** function `onNull`, use `toTaskEitherAsync`.
  TaskEither<L, T> toTaskEither<L>(L Function() onNull) =>
      TaskEither.fromNullable(this, onNull);

  /// Convert a nullable type `T?` to [TaskEither] using an **async function**:
  /// {@macro fpdart_on_nullable_to_either}
  ///
  /// If you want to run an **sync** function `onNull`, use `toTaskEither`.
  TaskEither<L, T> toTaskEitherAsync<L>(Task<L> onNull) =>
      TaskEither.fromNullableAsync(this, onNull);
}
