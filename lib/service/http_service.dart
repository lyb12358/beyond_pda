import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';

import '../pages/home_page.dart';

class HttpService extends GetxService {
  late Dio _dio;

  Future<HttpService> init({
    required String baseUrl,
  }) async {
    _dio = Dio();
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(milliseconds: 10000);
    _dio.options.receiveTimeout = const Duration(milliseconds: 20000);
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    _dio.interceptors.add(_interceptor);
    return this;
  }

  final Interceptor _interceptor = InterceptorsWrapper(
    onRequest: (options, handler) {
      GetStorage box = GetStorage();
      options.headers['cookie'] = box.read("x-token") ?? '';
      options.headers['x-token'] = box.read("x-token") ?? '';
      options.headers['systemCode'] = 'TerminalPlatform';
      return handler.next(options);
    },
    onResponse: (response, handler) {
      if (response.data['code'] == 403) {
        Get.offAll(() => HomePage());
        Get.snackbar(
          '警告',
          '登录已过期！',
          icon: Icon(
            Icons.info_outlined,
          ),
          shouldIconPulse: true,
          isDismissible: true,
          duration: Duration(seconds: 2),
        );
      } else {
        //debugPrint('response: $response');
        return handler.next(response);
      }
    },
    onError: (error, handler) {
      debugPrint('response: $error');
      return handler.next(error);
    },
  );

  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (_) {
      // 处理错误，例如自动重试
      rethrow;
    }
  }

  Future<Response<T>> post<T>(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (_) {
      // 处理错误，例如自动重试
      rethrow;
    }
  }

  Future<Response<T>> put<T>(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final response = await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (_) {
      // 处理错误，例如自动重试
      rethrow;
    }
  }
}
