//coverage:ignore-file

import 'package:dio/dio.dart' as dio;

import 'adapters.dart';

abstract class HttpAdapter {
  Future<dio.Response?> request({
    required HttpMethod httpMethod,
    required String url,
    required bool needsAuthorization,
    bool refreshAuthorization = false,
    bool throwException = true,
    dynamic data,
    String? pathFile,
  });
}
