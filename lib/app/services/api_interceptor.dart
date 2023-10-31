import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_project/app/services/excecptions.dart';

class ApiInterceptors extends Interceptor {
  final Dio dio;

  ApiInterceptors(this.dio);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    _logSuccessResponse(response);
  }

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
    try {} on StateError {
      /// Do nothing.
    } catch (e) {
      handler.reject(DioException(requestOptions: options), true);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logErrorResponse(err);

    _catchExceptions(err);

    return handler.next(err);
  }
}

class ApiCommonInterceptors extends Interceptor {
  final Dio dio;

  ApiCommonInterceptors(this.dio);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    _logSuccessResponse(response);
  }

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
    try {
      handler.next(options);
    } on StateError {
      /// Do nothing.
    } catch (e) {
      handler.reject(DioException(requestOptions: options), true);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logErrorResponse(err);
    _catchExceptions(err);
    return handler.next(err);
  }
}

_logSuccessResponse(Response response) {
  log("======================= API LOG =========================");
  log("[SUCCESS] Api Response -> ${response.data}");
  log("[SUCCESS] Api Request Path -> ${response.requestOptions.path}");
  log("[SUCCESS] Api Request Data -> ${response.requestOptions.data}");
}

_logErrorResponse(DioException err) {
  log("======================= API LOG =========================");
  if (err.response != null) {
    log("[FAIL] Api Error -> ${err.message}");
    log("[FAIL] Api Response -> ${err.response!.data}");
    log("[FAIL] Api Request Path -> ${err.requestOptions.path}");
    log("[FAIL] Api Request Data -> ${err.requestOptions.data}");
  } else {
    log("[FAIL] Api Error -> ${err.message}");
    log("[FAIL] Api Request Path -> ${err.requestOptions.path}");
    log("[FAIL] Api Request Data -> ${err.requestOptions.data}");
  }
}

_catchExceptions(DioException err) {
  switch (err.type) {
    case DioExceptionType.connectionTimeout:
    case DioException.sendTimeout:
    case DioException.receiveTimeout:
      throw DeadlineExceededException(requestOptions: err.requestOptions);
    case DioExceptionType.badResponse:
      switch (err.response?.statusCode) {
        case 400:
          throw ResponseFromServerException(
              err.response!.data["message"] ?? "Something went wrong",
              requestOptions: err.requestOptions);
        case 401:
          throw UnauthorizedException(requestOptions: err.requestOptions);
        case 404:
          throw NotFoundException(requestOptions: err.requestOptions);
        case 409:
          throw ConflictException(requestOptions: err.requestOptions);
        case 429:
          throw TooManyRequestException(requestOptions: err.requestOptions);
        case 500:
          throw InternalServerErrorException(
              requestOptions: err.requestOptions);
        default:
          throw InternalServerErrorException(
              requestOptions: err.requestOptions);
      }
    case DioExceptionType.cancel:
      break;
    case DioExceptionType.unknown:
      log("Other Error : ${err.message}");
      throw NoInternetConnectionException(requestOptions: err.requestOptions);
    case DioExceptionType.sendTimeout:
    default:
      log("default error message : ${err.message}");
  }
}

class BadRequestException extends ApiError {
  BadRequestException({required super.requestOptions});

  @override
  String toString() {
    return 'Invalid request';
  }
}

class TooManyRequestException extends ApiError {
  TooManyRequestException({required super.requestOptions});

  @override
  String toString() {
    return "Too many requests! Please try again.";
  }
}

class InternalServerErrorException extends ApiError {
  InternalServerErrorException({required super.requestOptions});

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends ApiError {
  ConflictException({required super.requestOptions});

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends ApiError {
  UnauthorizedException({required super.requestOptions});

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends ApiError {
  NotFoundException({required super.requestOptions});

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends ApiError {
  NoInternetConnectionException({required super.requestOptions});

  @override
  String toString() {
    return 'An unexpected response received from the server.';
  }
}

class DeadlineExceededException extends ApiError {
  DeadlineExceededException({required super.requestOptions});

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}

class ResponseFromServerException extends ApiError {
  final String msg;

  ResponseFromServerException(this.msg, {required super.requestOptions});

  @override
  String toString() {
    return msg;
  }
}
