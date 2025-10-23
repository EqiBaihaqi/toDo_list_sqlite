
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response;

import '../session/session_key.dart';
import '../session/session_manager.dart';
import '../utils/base_url_utils.dart';
import 'api_config.dart';
import 'pretty_dio_logger.dart';
import 'package:dio/src/form_data.dart' as d;
import 'package:dio/src/multipart_file.dart' as m;

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;
  late final Dio? dio;
  final SessionManager _sessionManager = Get.find();

  DioClient._internal() {
    final baseUrlUtils = BaseUrl();
    dio =
        Dio(
            BaseOptions(
              baseUrl: baseUrlUtils.getUrlDevice(),
              connectTimeout: ApiConfig.connectionTimeout,
              receiveTimeout: ApiConfig.receiveTimeout,
              responseType: ResponseType.json,
              contentType: ApiConfig.contentType,
            ),
          )
          ..interceptors.add(
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              responseHeader: false,
              error: true,
              compact: true,
              maxWidth: 90,
            ),
          )
          ..interceptors.add(
            InterceptorsWrapper(
              onRequest: (options, handler) async {
                options.headers['Accept'] = 'application/json';
                final token = _sessionManager.read(SessionKey.token);
                if (token != null) {
                  options.headers['Authorization'] = 'Bearer $token';
                }
                return handler.next(options);
              },
              onError: (error, handler) async {
                return handler.next(error);
              },
              onResponse: (response, handler) async {
                return handler.next(response);
              },
            ),
          );
  }

  Future<Response<T>> getRequest<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    if (dio == null) {
      throw Exception("Dio client not initialized");
    }
    try {
      final processedParams = queryParameters?.map(
        (key, value) => MapEntry(key, value ?? ''),
      );

      final response = await dio!.get<T>(url, queryParameters: processedParams);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> postRequest<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    if (dio == null) {
      throw Exception("Dio client not initialized");
    }
    try {
      final response = await dio!.post<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> putRequest<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (dio == null) {
      throw Exception("Dio client not initialized");
    }
    try {
      final response = await dio!.put<T>(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> deleteRequest<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (dio == null) {
      throw Exception("Dio client not initialized");
    }
    try {
      final response = await dio!.delete<T>(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> uploadPhoto<T>(
    String url, {
    required String filePath,
    Map<String, dynamic>? queryParameters,
    String fieldName = 'image',
  }) async {
    final token = _sessionManager.read(SessionKey.token);
    if (dio == null) {
      throw Exception("Dio client not initialized");
    }

    debugPrint('fieldName -> $fieldName');

    try {
      final String fileName = filePath.split('/').last;
      final d.FormData formData = d.FormData.fromMap({
        fieldName: await m.MultipartFile.fromFile(filePath, filename: fileName),
        ...queryParameters ?? {},
      });

      debugPrint('FormData Fields: ${formData.fields}'); // Cetak fields
      debugPrint('FormData Files: ${formData.files}'); // Cetak files

      final response = await dio!.post<T>(
        url,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
