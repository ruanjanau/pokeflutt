//coverage:ignore-file

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as dio;

import 'adapters.dart';

class HttpAdapterImpl implements HttpAdapter {
  final _dio = dio.Dio(
    dio.BaseOptions(
      baseUrl: 'https://6573803a063f876cec9cf9f6.mockapi.io/',
      receiveDataWhenStatusError: true,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      contentType: dio.Headers.jsonContentType,
      followRedirects: false,
    ),
  );

  dio.Dio get dioInstance => _dio;

  @override
  Future<dio.Response?> request({
    required HttpMethod httpMethod,
    required String url,
    required bool needsAuthorization,
    bool refreshAuthorization = false,
    bool throwException = true,
    data,
    String? pathFile,
  }) async {
    try {
      log('[HTTP] Request type ${httpMethod.name()} in URL $url');

      if (data != null) log('[HTTP] with body ${jsonEncode(data)}');

      late dio.Response response;

      switch (httpMethod) {
        case HttpMethod.get:
          response = await dioInstance.get(url);
          break;
        case HttpMethod.post:
          response = await dioInstance.post(url, data: data);
          break;
        case HttpMethod.patch:
          response = await dioInstance.patch(url, data: data);
          break;
        case HttpMethod.put:
          response = await dioInstance.put(url, data: data);
          break;
        case HttpMethod.delete:
          response = await dioInstance.delete(url, data: data);
          break;
        case HttpMethod.download:
          response = await dioInstance.download(url, pathFile);
          break;
      }

      if (response.data is Map && response.data['message'] != null) {
        log('[HTTP] ${response.data['message']}');
      }

      return response;
    } on dio.DioException catch (e) {
      _exceptionHandler(data, e, url);
    }
    return null;
  }

  void _exceptionHandler(dynamic data, dio.DioException e, String url) {
    log('[HTTP] ${e.response}');
  }
}
