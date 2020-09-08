import 'package:dio/dio.dart';
import 'package:tartlabsstore/src/AppException.dart';
import 'package:tartlabsstore/src/responses/auth_response.dart';
import 'package:tartlabsstore/src/utils/api_credentials.dart';
import 'package:tartlabsstore/src/utils/api_endpoints.dart';
import 'package:tartlabsstore/src/utils/dio_helper.dart';

class LoginRepository {
  static Future<AuthResponse> login({email, password}) async {
    try {
      final response = await dio.post(APIEndpoints.login, data: {
        "username": email,
        "password": password,
        "grant_type": APICredentials.grantType,
        "client_secret": APICredentials.clientSecret,
        "client_id": APICredentials.clientId,
      });

      return AuthResponse.fromJson(response?.data);
    } on DioError catch (e) {
      throw AppException(e.response.data["message"]);
    }
  }
}
