import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tartlabsstore/src/models/token_model.dart';
import 'package:tartlabsstore/src/utils/app_utils.dart';
import 'package:tartlabsstore/src/utils/constants.dart';
import 'package:tartlabsstore/src/utils/http_urls.dart';
import 'package:tartlabsstore/src/utils/preference_helper.dart';

class DioHelper {
  static Dio _dio;

  static Dio getInstance() {
    if (_dio == null) {
      _dio = Dio();
      _dio.options.baseUrl = Constants.BASE_URL;
      _dio.options.headers[HttpHeaders.acceptHeader] = 'application/json';
    }
    setAuthorizationHeader();
    return _dio;
  }

  static setAuthorizationHeader() {
    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: (Options options) async {
        TokenModel currentToken = await PreferenceHelper.getToken();
        if (currentToken == null) return options;

        int expiresAt = DateTime.now().millisecondsSinceEpoch +
            (currentToken.expiresIn * Duration.millisecondsPerSecond);
        int currentDateTime = DateTime.now().millisecondsSinceEpoch;

        if (expiresAt > currentDateTime) {
          options.headers[HttpHeaders.authorizationHeader] =
              'Bearer ' + currentToken.accessToken;
          return options;
        }

        TokenModel newToken = await getRefreshToken(dio, currentToken);
        if (newToken == null) return options;

        options.headers[HttpHeaders.authorizationHeader] =
            'Bearer' + newToken.accessToken;
        return options;
      }, onError: (error) {
        if (error.type == DioErrorType.RESPONSE) {
          switch (error.response.statusCode) {
            case 403:
              AppUtils.showToast("403 Forbidden");
              break;
            case 404:
              AppUtils.showToast("404 Forbidden");
              break;
            case 429:
              AppUtils.showToast("Too many requests");
              break;
            case 500:
              AppUtils.showToast("500 Server Broken");
              break;
            case 405:
              AppUtils.showToast("405 Method Not Allowed");
              break;
          }
        } else if (error.type == DioErrorType.DEFAULT) {
          AppUtils.showToast("Check your internet connection");
        } else {
          AppUtils.showToast(error.message);
        }
      }),
    );
  }

  static getRefreshToken(Dio dio, TokenModel token) async {
    try {
      String url = Constants.BASE_URL + HttpUrls.REFRESH_TOKEN_URL;
      Response response = await dio.post(url, data: {
        "client_id": Constants.CLIENT_ID,
        "client_secret": Constants.CLIENT_SECRET,
        "grant_type": Constants.REFRESH_GRANT_TYPE,
        "refresh_token": token.refreshToken,
      });

      TokenModel tokenResponse = TokenModel.fromJson(response.data);
      if (tokenResponse != null) {
        await PreferenceHelper.saveToken(tokenResponse);
      }
      return tokenResponse;
    } catch (error) {
      return;
    }
  }
}

final dio = DioHelper.getInstance();
