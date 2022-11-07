import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:mobx_pattern/core/exception/env_not_found.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    if (_instance != null) return _instance!;
    _instance = NetworkManager._init();
    return _instance!;
  }

  late final Dio dio;

  NetworkManager._init() {
    final url = dotenv.env['BASE_URL'];
    if (url != null) {
      dio = Dio(BaseOptions(baseUrl: url));
      if (kDebugMode) dio.interceptors.add(dioLoggerInterceptor);
      // dio.interceptors.add(InterceptorsWrapper(
      //   onRequest: (options, handler) {
      //     options.path += '.json';
      //     handler.next(options);
      //   },
      // )); //her request ve responsedan önce çalışan ara katman -performans kaybı
    } else {
      throw EnvNotFound('BASE_URL');
    }
  }
}
