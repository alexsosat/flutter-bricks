import "package:dio/dio.dart";
import "package:flutter_common_classes/flutter_common_classes.dart";

/// Interceptor for handling HTTP errors
class HttpErrorInterceptor extends Interceptor {
  /// Constructor
  HttpErrorInterceptor({required this.internetInfo});

  /// The network info instance
  final NetworkInfo internetInfo;

  @override
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final logger = getLogger("HttpErrorInterceptor");

    try {
      final isConnected = await internetInfo.isConnected;
      final errorObject = _parseDioError(err, isConnected: isConnected);

      final customError = err.copyWith(error: errorObject);
      logger.e("Formatted Error: $customError");

      handler.reject(customError);
    } catch (e, s) {
      logger.e("Error during interceptor execution: $e - $s");
      handler.reject(err.copyWith(error: e));
    }
  }

  HttpCallException _parseDioError(
    DioException error, {
    required bool isConnected,
  }) {
    switch (error.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.unknown:
        return isConnected
            ? ConnectionErrorException.serverDown()
            : ConnectionErrorException.clientOffline();

      case DioExceptionType.cancel:
        return ClientErrorException.cancelRequest();

      case DioExceptionType.badCertificate:
        return ServerErrorException.badCertificate();

      case DioExceptionType.badResponse:
        return _parseBadResponse(error.response);
    }
  }

  HttpCallException _parseBadResponse(Response? response) {
    if (response == null) return ClientErrorException.badRequest();

    final statusCode = response.statusCode ?? 0;
    final dynamic data = response.data;

    // 5xx Server Errors
    if (statusCode >= 500) {
      if (data is Map<String, dynamic>) {
        return ServerErrorException.general(data: data);
      }
      return ServerErrorException(
        title: FlutterCommonLocalizations.current.serverErrorTitle,
        message:
            data?.toString() ??
            FlutterCommonLocalizations.current.ServerErrorMessage,
        data: {"message": data},
      );
    }

    // 4xx Client Errors
    if (statusCode == 404) {
      return ClientErrorException.notFound(
        code: statusCode,
        data: data is Map<String, dynamic> ? data : null,
      );
    }

    if (statusCode >= 401 && statusCode <= 403) {
      return ClientErrorException.unauthorized(
        code: statusCode,
        data: data is Map<String, dynamic> ? data : {"message": data},
      );
    }

    // Default 400/Other handling with 400 override message from response map
    String? customMessage;
    if (data is Map<String, dynamic>) {
      // TODO: Parse custom message from response map
      customMessage = data["message"];
    }

    return ClientErrorException.badRequest(
      code: statusCode,
      message: customMessage,
      data: data is Map<String, dynamic> ? data : null,
    );
  }
}
