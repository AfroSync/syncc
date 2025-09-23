import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// API configuration and base URL
class ApiConfig {
  static const String baseUrl =
      'https://lively-helpful-monarch.ngrok-free.app/';

  // static const String baseUrl = 'https://backend-f0qn.onrender.com';

  static const Duration timeout = Duration(seconds: 30);
}

/// API response wrapper
class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? error;
  final int? statusCode;

  const ApiResponse({
    required this.success,
    this.data,
    this.error,
    this.statusCode,
  });

  factory ApiResponse.success(T data, {int? statusCode}) {
    return ApiResponse(success: true, data: data, statusCode: statusCode);
  }

  factory ApiResponse.error(String error, {int? statusCode}) {
    return ApiResponse(success: false, error: error, statusCode: statusCode);
  }
}

/// Base API service class that provides common functionality
abstract class BaseApiService {
  late final Dio _dio;

  /// Initialize Dio with base configuration
  void initialize() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.timeout,
        receiveTimeout: ApiConfig.timeout,
        sendTimeout: ApiConfig.timeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors for logging in debug mode
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
        ),
      );
    }
  }

  /// Generic HTTP request method
  Future<ApiResponse<T>> request<T>({
    required String endpoint,
    required String method,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      final options = Options(method: method, headers: headers);

      Response response;

      switch (method.toUpperCase()) {
        case 'GET':
          response = await _dio.get(
            endpoint,
            options: options,
            queryParameters: queryParams,
          );
          break;
        case 'POST':
          response = await _dio.post(endpoint, data: body, options: options);
          break;
        case 'PUT':
          response = await _dio.put(endpoint, data: body, options: options);
          break;
        case 'DELETE':
          response = await _dio.delete(endpoint, options: options);
          break;
        default:
          throw Exception('Unsupported HTTP method: $method');
      }

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        if (response.data == null) {
          return ApiResponse<T>.success(
            null as T,
            statusCode: response.statusCode,
          );
        }

        if (fromJson != null) {
          final data = fromJson(response.data as Map<String, dynamic>);
          return ApiResponse.success(data, statusCode: response.statusCode);
        } else {
          return ApiResponse<T>.success(
            response.data as T,
            statusCode: response.statusCode,
          );
        }
      } else {
        String errorMessage =
            'Request failed with status ${response.statusCode}';

        if (response.data is Map<String, dynamic>) {
          final errorJson = response.data as Map<String, dynamic>;
          errorMessage =
              errorJson['message'] ?? errorJson['error'] ?? errorMessage;
        }

        return ApiResponse.error(errorMessage, statusCode: response.statusCode);
      }
    } on DioException catch (e) {
      String errorMessage = 'Request failed';

      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Request timeout';
          break;
        case DioExceptionType.connectionError:
          errorMessage = 'No internet connection';
          break;
        case DioExceptionType.badResponse:
          if (e.response?.data is Map<String, dynamic>) {
            final errorJson = e.response!.data as Map<String, dynamic>;
            errorMessage =
                errorJson['message'] ??
                errorJson['error'] ??
                'Request failed with status ${e.response?.statusCode}';
          } else {
            errorMessage =
                'Request failed with status ${e.response?.statusCode}';
          }
          break;
        case DioExceptionType.cancel:
          errorMessage = 'Request cancelled';
          break;
        default:
          errorMessage = 'An unexpected error occurred: ${e.message}';
      }

      return ApiResponse.error(
        errorMessage,
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      if (kDebugMode) {
        print('API Error: $e');
      }
      return ApiResponse.error('An unexpected error occurred: $e');
    }
  }

  /// Upload file using multipart/form-data
  Future<ApiResponse<T>> uploadFile<T>({
    required String endpoint,
    required File file,
    required String fieldName,
    Map<String, dynamic>? queryParams,
    Map<String, String>? additionalFields,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      final fileName = file.path.split('/').last;
      final formData = FormData.fromMap({
        fieldName: await MultipartFile.fromFile(file.path, filename: fileName),
        if (additionalFields != null) ...additionalFields,
      });

      final response = await _dio.post(
        endpoint,
        data: formData,
        queryParameters: queryParams,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        if (response.data == null) {
          return ApiResponse<T>.success(
            null as T,
            statusCode: response.statusCode,
          );
        }

        if (fromJson != null) {
          final data = fromJson(response.data as Map<String, dynamic>);
          return ApiResponse.success(data, statusCode: response.statusCode);
        } else {
          return ApiResponse<T>.success(
            response.data as T,
            statusCode: response.statusCode,
          );
        }
      } else {
        String errorMessage =
            'Upload failed with status ${response.statusCode}';

        if (response.data is Map<String, dynamic>) {
          final errorJson = response.data as Map<String, dynamic>;
          errorMessage =
              errorJson['message'] ?? errorJson['error'] ?? errorMessage;
        }

        return ApiResponse.error(errorMessage, statusCode: response.statusCode);
      }
    } on DioException catch (e) {
      String errorMessage = 'Upload failed';

      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Upload timeout';
          break;
        case DioExceptionType.connectionError:
          errorMessage = 'No internet connection';
          break;
        case DioExceptionType.badResponse:
          if (e.response?.data is Map<String, dynamic>) {
            final errorJson = e.response!.data as Map<String, dynamic>;
            errorMessage =
                errorJson['message'] ??
                errorJson['error'] ??
                'Upload failed with status ${e.response?.statusCode}';
          } else {
            errorMessage =
                'Upload failed with status ${e.response?.statusCode}';
          }
          break;
        case DioExceptionType.cancel:
          errorMessage = 'Upload cancelled';
          break;
        default:
          errorMessage = 'An unexpected error occurred: ${e.message}';
      }

      return ApiResponse.error(
        errorMessage,
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Upload Error: $e');
      }
      return ApiResponse.error('An unexpected error occurred: $e');
    }
  }

  /// Dispose resources
  void dispose() {
    _dio.close();
  }
}
