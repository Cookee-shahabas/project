import 'package:dio/dio.dart';
import 'package:final_project/app/services/api_interceptor.dart';
import 'package:final_project/src/domain/constants/api_urls.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Api {
  final call = createDio();
  final general = createGeneralDio();
  final dioToken = Dio(BaseOptions(baseUrl: AppUrls.baseUrl));

  Api._internal();

  static final _singleton = Api._internal();
  factory Api() => _singleton;

  /// Function for creating dio instance for calling apis
  static Dio createDio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: AppUrls.baseUrl,
        receiveTimeout: const Duration(seconds: 30), // 30 seconds
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );

    dio.interceptors.addAll([ApiInterceptors(dio)]);

    return dio;
  }

  /// Function for creating dio instance for calling apis
  /// not requires access token
  static Dio createGeneralDio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: AppUrls.baseUrl,
        receiveTimeout: const Duration(seconds: 30), // 30 seconds
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );

    dio.interceptors.addAll([ApiCommonInterceptors(dio)]);

    return dio;
  }
}
