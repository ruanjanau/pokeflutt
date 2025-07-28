//coverage:ignore-file

import 'package:dio/dio.dart';

class DioNetwork {
  Dio dioClient = Dio();
  static const baseUrl = 'https://pokeapi.co/api/v2';

  static final DioNetwork _instance = DioNetwork._internal();
  factory DioNetwork() {
    _instance.dioClient.interceptors.add(getInterceptor());
    return _instance;
  }

  DioNetwork._internal();

  Dio get dio => dioClient;

  static InterceptorsWrapper getInterceptor() {
    return InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) =>
              handler.next(options),
      onResponse:
          (Response response, ResponseInterceptorHandler handler) =>
              handler.next(response),
      onError:
          (DioException e, ErrorInterceptorHandler handler) => handler.next(e),
    );
  }
}
