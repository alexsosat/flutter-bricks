import 'package:dio/dio.dart';

/// Interceptor for adding authentication headers to requests
class AuthInterceptor extends Interceptor {
  /// Constructor
  AuthInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Add authentication headers here
    handler.next(options);
  }
}
