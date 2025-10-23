import 'package:dio/dio.dart' show Response, DioException;
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:getx_pattern_architecture/app/models/pagination_result.dart';

import '../network/dio_client.dart';
import '../network/dio_exception.dart';

abstract class RepositoryHelper {
  final DioClient dioClient = DioClient();

  Future<Either<String, T>> callApi<T>({
    required Future<Response> api,
    T Function(dynamic json)? jsonCallback, // Callback opsional
  }) async {
    try {
      Response response = await api;

      // Periksa statusCode
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'];

        if (data != null) {
          if (jsonCallback != null) {
            // Jika jsonCallback diberikan, proses data
            try {
              return right(jsonCallback(data));
            } catch (e) {
              return left(
                  "Terjadi kesalahan saat memproses data: ${e.toString()}");
            }
          } else {
            // Jika jsonCallback tidak diberikan, return bool
            return right(true as T);
          }
        } else if (data == null && jsonCallback == null) {
          return right(true as T);
        } else {
          final message = response.data['message'] ?? 'Data tidak ditemukan';
          return left(message);
        }
      } else {
        final message = response.data['message'] ??
            'Terjadi kesalahan pada server dengan status: ${response.statusCode}';
        return left(message);
      }
    } on DioException catch (dioError) {
      return left(handleDioError(dioError));
    } on FormatException catch (formatError) {
      final errorMessage = kDebugMode
          ? "Format data tidak valid: $formatError"
          : 'Format data tidak valid';
      return left(errorMessage);
    } catch (error) {
      final errorMessage =
          kDebugMode ? "Terjadi kesalahan: $error" : 'Terjadi kesalahan';
      return left(errorMessage);
    }
  }
  Future<Either<String, T>> callApiWithoutData<T>({
  required Future<Response> api,
  T Function(Map<String, dynamic> responseJson)? messageMapper,
}) async {
  try {
    final Response response = await api;
    final statusCode = response.statusCode ?? 0;
    final responseData = response.data;

    if (statusCode == 200 || statusCode == 201) {
      if (messageMapper != null) {
        return right(messageMapper(responseData));
      } else {
        return right(true as T); // default jika tidak ingin parsing
      }
    } else {
      final message = responseData['message'] ?? 'Terjadi kesalahan server';
      return left(message);
    }
  } catch (e) {
    return left("Terjadi kesalahan: $e");
  }
}


  Future<Either<String, List<T>>> callApiWithListData<T>({
    required Future<Response> api,
    required T Function(dynamic json) jsonCallback,
  }) async {
    try {
      Response response = await api;

      // Periksa statusCode
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'];

        if (data != null && data is List) {
          try {
            final dataList = data.map((item) => jsonCallback(item)).toList();
            // if (dataList.isNotEmpty) {
            //   return right(dataList);
            // } else {
            //   return left("Data kosong");
            // }
            return right(dataList);
          } catch (e) {
            return left(
                "Terjadi kesalahan saat memproses data list: ${e.toString()}");
          }
        } else {
          return left('Format data tidak valid: Data tidak berupa list');
        }
      } else {
        final message = response.data['message'] ??
            'Terjadi kesalahan pada server dengan status: ${response.statusCode}';
        return left(message);
      }
    } on DioException catch (dioError) {
      final errorMessage = DioExceptions.fromDioError(dioError).toString();
      return left(errorMessage);
    } on FormatException catch (formatError) {
      final errorMessage = kDebugMode
          ? "Format data tidak valid: $formatError"
          : 'Format data tidak valid';
      return left(errorMessage);
    } catch (error) {
      final errorMessage =
          kDebugMode ? "Terjadi kesalahan: $error" : 'Terjadi kesalahan';
      return left(errorMessage);
    }
  }

  // Future<Either<String, PaginationResult<T>>> callApiWithListDataPagination<T>({
  //   required Future<Response> api,
  //   required T Function(dynamic json) jsonCallback,
  // }) async {
  //   try {
  //     Response response = await api;

  //     // Periksa statusCode
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final data = response.data['data'];

  //       if (data != null &&
  //           data['requests'] != null &&
  //           data['requests'] is List) {
  //         try {
  //           // Parsing daftar data
  //           final dataList = (data['requests'] as List)
  //               .map((item) => jsonCallback(item))
  //               .toList();

  //           // Parsing informasi paginasi
  //           final pagination = PaginationInfo.fromJson(data['pagination']);

  //           return right(
  //               PaginationResult(data: dataList, pagination: pagination));
  //         } catch (e) {
  //           return left(
  //               "Terjadi kesalahan saat memproses data list: ${e.toString()}");
  //         }
  //       } else {
  //         return left('Format data tidak valid: Data tidak berupa list');
  //       }
  //     } else {
  //       final message = response.data['message'] ??
  //           'Terjadi kesalahan pada server dengan status: ${response.statusCode}';
  //       return left(message);
  //     }
  //   } on DioException catch (dioError) {
  //     final errorMessage = DioExceptions.fromDioError(dioError).toString();
  //     return left(errorMessage);
  //   } on FormatException catch (formatError) {
  //     final errorMessage = kDebugMode
  //         ? "Format data tidak valid: $formatError"
  //         : 'Format data tidak valid';
  //     return left(errorMessage);
  //   } catch (error) {
  //     final errorMessage =
  //         kDebugMode ? "Terjadi kesalahan: $error" : 'Terjadi kesalahan';
  //     return left(errorMessage);
  //   }
  // }

  Future<Either<String, PaginationResult<T>>>
      callApiWithListDataPaginationWithoutRequest<T>({
    required Future<Response> api,
    required T Function(dynamic json) jsonCallback,
  }) async {
    try {
      Response response = await api;

      // Periksa statusCode
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'];

        if (data != null && data is List) {
          try {
            // Parsing daftar data
            final dataList = data.map((item) => jsonCallback(item)).toList();

            // Parsing informasi paginasi
            final pagination =
                PaginationInfo.fromJson(response.data['pagination']);

            return right(
                PaginationResult(data: dataList, pagination: pagination));
          } catch (e) {
            return left(
                "Terjadi kesalahan saat memproses data list: ${e.toString()}");
          }
        } else {
          return left('Format data tidak valid: Data tidak berupa list');
        }
      } else {
        final message = response.data['message'] ??
            'Terjadi kesalahan pada server dengan status: ${response.statusCode}';
        return left(message);
      }
    } on DioException catch (dioError) {
      final errorMessage = DioExceptions.fromDioError(dioError).toString();
      return left(errorMessage);
    } on FormatException catch (formatError) {
      final errorMessage = kDebugMode
          ? "Format data tidak valid: $formatError"
          : 'Format data tidak valid';
      return left(errorMessage);
    } catch (error) {
      final errorMessage =
          kDebugMode ? "Terjadi kesalahan: $error" : 'Terjadi kesalahan';
      return left(errorMessage);
    }
  }

  String handleDioError(DioException dioError) {
    if (dioError.response?.statusCode == 401 ||
        dioError.response?.statusCode == 404) {
      var errorMessage =
          dioError.response?.data['message'] ?? 'Permintaan Tidak Valid';
      return errorMessage;
    }

    // Menangani error dengan statusCode 422 (Validation Error)
    if (dioError.response?.statusCode == 422) {
      var errorMessage = dioError.response?.data['message'] ?? 'Validasi Gagal';
      var validationErrors = dioError.response?.data['data'];

      if (validationErrors != null) {
        try {
          validationErrors.forEach((key, value) {
            errorMessage += '\n$key: ${value.join(', ')}';
          });
        } catch (e) {
          errorMessage =
              dioError.response?.data['message'] ?? 'Permintaan Tidak Valid';
        }
      }
      return errorMessage;
    } else {
      if (dioError.response?.data != null) {
        final errorMessage = dioError.response?.data['message'];
        if (errorMessage != null) {
          return errorMessage;
        }
      }
      return DioExceptions.fromDioError(dioError).toString();
    }
  }
  
}
Future<Either<String, PaginationResult<T>>> callApiWithListDataPagination<T>({
  required Future<Response> api,
  required T Function(dynamic json) jsonCallback,
}) async {
  try {
    final response = await api;

    if (response.statusCode == 200 || response.statusCode == 201) {
      final rawData = response.data['data'];
      final rawPagination = response.data['pagination'];

      List<dynamic>? extractedList;

      // Coba deteksi otomatis apakah 'data' langsung list atau berisi 'requests'
      if (rawData is List) {
        extractedList = rawData;
      } else if (rawData is Map<String, dynamic> && rawData['requests'] is List) {
        extractedList = rawData['requests'];
      }

      if (extractedList != null && rawPagination != null) {
        try {
          final dataList = extractedList.map((item) => jsonCallback(item)).toList();
          final pagination = PaginationInfo.fromJson(rawPagination);

          return right(PaginationResult(data: dataList, pagination: pagination));
        } catch (e) {
          return left("Terjadi kesalahan saat memproses data list: ${e.toString()}");
        }
      } else {
        return left('Format data tidak valid: Tidak ditemukan list data yang sesuai.');
      }
    } else {
      final message = response.data['message'] ??
          'Terjadi kesalahan pada server dengan status: ${response.statusCode}';
      return left(message);
    }
  } on DioException catch (dioError) {
    return left(DioExceptions.fromDioError(dioError).toString());
  } on FormatException catch (formatError) {
    return left(kDebugMode
        ? "Format data tidak valid: $formatError"
        : 'Format data tidak valid');
  } catch (error) {
    return left(kDebugMode
        ? "Terjadi kesalahan: $error"
        : 'Terjadi kesalahan');
  }
}
