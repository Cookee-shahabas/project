import 'package:dio/dio.dart';

class ApiError extends DioException {
  ApiError({required super.requestOptions});

  @override
  String toString() {
    var msg = error.toString();
    return msg;
  }
}
