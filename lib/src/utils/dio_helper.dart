import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tartlabsstore/src/utils/api_endpoints.dart';

class DioHelper {
  static Dio _dio;

  static Dio getInstance() {
    if (_dio == null) {
      _dio = Dio();
      _dio.options.baseUrl = API_BASE_URL;
      _dio.options.headers[HttpHeaders.acceptHeader] = 'application/json';
    }
    setAuthorizationHeader();
    return _dio;
  }

  static setAuthorizationHeader() {
    _dio.interceptors.add(
      InterceptorsWrapper(onError: (error) {
        if (error.type == DioErrorType.RESPONSE) {
          switch (error.response.statusCode) {
            case 401:
              print("401, ${error.response.statusMessage}");
              break;
            case 500:
              print("500, server broken");
              break;
            case 404:
              print("404, Not found");
              break;
            case 403:
              print("403, Forbidden");
              break;
            case 405:
              print("405, Method not allowed");
              break;
          }
        } else if (error.type == DioErrorType.DEFAULT) {
          print("Check your internet connection");
        } else {
          print(error.message);
        }
      }),
    );
  }
}

final dio = DioHelper.getInstance();
