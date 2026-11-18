import "package:dio/dio.dart";
import "package:fpdart/fpdart.dart";

import "app_exception.dart";
import "connection/http_call_exception.dart";
import "failure.dart";

/// The [RepositoryExecutionRunner] class is responsible for handling the exceptions
abstract class RepositoryExecutionRunner {
  /// Handles the exceptions that can be thrown in the application
  /// during an API call.
  ///
  /// It receives a [function] that is the API call to be executed.
  /// Returns an [Either] with the [Failure] or the [T] value.
  static Future<Either<Failure, T>> runAsync<T>(
    Future<T> Function() function,
  ) async {
    final logger = getLogger("ErrorHandler");
    try {
      return Right(await function());
    } on HttpCallException catch (exception) {
      return Left(HttpCallFailure.fromException(exception));
    } on DioException catch (exception) {
      if (exception.error is HttpCallException) {
        logger.e(
          "ErrorHandler.DioException, exception: ${(exception.error! as HttpCallException).message}",
        );

        return Left(
          HttpCallFailure.fromException(exception.error! as HttpCallException),
        );
      }

      return Left(AppFailure.unexpected(exception.error.toString()));
    } on EnvironmentException catch (e) {
      return Left(AppFailure.environment(exception: e));
    } on CacheException catch (exception) {
      return Left(AppFailure.cacheException(exception));
    } on AppException catch (exception) {
      return Left(AppFailure.unexpected(exception.message));
    } catch (e, stackTrace) {
      logger.e(
        "ErrorHandler.handleApiCall, function: $function, error: $e, stackTrace: $stackTrace",
      );

      return Left(AppFailure.unexpected(e.toString()));
    }
  }

  /// Handles the exceptions that can be thrown in the application
  /// during a cache call.
  ///
  /// It receives a [function] that is the cache call to be executed.
  /// Returns an [Either] with the [Failure] or the [T] value.
  static Either<Failure, T> run<T>(T Function() function) {
    try {
      return Right(function());
    } on EnvironmentException catch (e) {
      return Left(AppFailure.environment(exception: e));
    } on CacheException catch (exception) {
      return Left(AppFailure.cacheException(exception));
    } catch (e) {
      return Left(AppFailure.unexpected(e.toString()));
    }
  }
}
