/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: Sealed class for application-wide error handling.
 * Relevant Info: Used by safeApiCall to map network/API failures. */

sealed class AppError implements Exception {
  const AppError();
}

class NetworkError extends AppError {
  final String? message;
  const NetworkError([this.message]);
}

class ServerError extends AppError {
  final int? code;
  final String? message;
  const ServerError({this.code, this.message});
}

class SocketTimeoutError extends AppError {
  const SocketTimeoutError();
}

class UnknownError extends AppError {
  final String? message;
  const UnknownError([this.message]);
}
