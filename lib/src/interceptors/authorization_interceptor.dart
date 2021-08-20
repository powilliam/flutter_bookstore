import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final Map<String, dynamic> newQueryParameters = {
      ...options.queryParameters,
      'key': dotenv.get('BOOKS_API_KEY')
    };
    final RequestOptions newOptions =
        options.copyWith(queryParameters: newQueryParameters);
    return handler.next(newOptions);
  }
}
