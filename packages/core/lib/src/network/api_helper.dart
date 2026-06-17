/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Helper for making safe API calls with error handling and retries.
 * Relevant Info: Adapted from Kotlin safeApiCall pattern. */

import 'dart:io';
import 'package:core/src/error/app_error.dart';
import 'package:core/src/result/result_wrapper.dart';
import 'package:dio/dio.dart';

mixin ApiHelper {
  Future<ResultWrapper<T>> safeApiCall<T>({
    required Future<Response<T>> Function() operation,
    int maxRetries = 1,
  }) async {
    try {
      final response = await operation();
      final statusCode = response.statusCode ?? -1;

      if (statusCode >= 200 && statusCode < 300) {
        final body = response.data;
        if (body != null) {
          return Success(body);
        } else {
          return Failure(ServerError(code: statusCode, message: 'Empty response body'));
        }
      }

      if (statusCode == 403) {
        // Handle re-authentication if necessary
        // This is a placeholder for actual re-auth logic
        if (maxRetries > 0) {
          return safeApiCall(operation: operation, maxRetries: maxRetries - 1);
        }
        return Failure(ServerError(code: statusCode, message: 'Forbidden'));
      }

      if (statusCode == 400) {
        // Try to parse dynamic error body
        final errorData = response.data;
        String? message;
        if (errorData is Map<String, dynamic>) {
          message = errorData['message'] as String?;
        }
        return Failure(ServerError(code: statusCode, message: message));
      }

      return Failure(ServerError(code: statusCode, message: response.statusMessage));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return const Failure(SocketTimeoutError());
      }
      
      if (e.error is SocketException && maxRetries > 0) {
        await Future.delayed(const Duration(milliseconds: 500));
        return safeApiCall(operation: operation, maxRetries: maxRetries - 1);
      }

      return Failure(NetworkError(e.message));
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }
}
