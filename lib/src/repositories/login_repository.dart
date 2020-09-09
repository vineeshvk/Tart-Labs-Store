import 'package:dio/dio.dart';
import 'package:tartlabsstore/src/app_exception.dart';
import 'package:tartlabsstore/src/responses/auth_response.dart';
import 'package:tartlabsstore/src/utils/constants.dart';
import 'package:tartlabsstore/src/utils/dio_helper.dart';
import 'package:tartlabsstore/src/utils/http_urls.dart';

class LoginRepository {
  static Future<AuthResponse> login({email, password}) async {
    try {
      final response = await dio.post(HttpUrls.LOGIN, data: {
        "username": email,
        "password": password,
        "grant_type": Constants.GRANT_TYPE,
        "client_secret": Constants.CLIENT_SECRET,
        "client_id": Constants.CLIENT_ID,
      });

      return AuthResponse.fromJson(response?.data);
    } on DioError catch (e) {
      throw AppException(e.response.data["message"]);
    }
  }
}
