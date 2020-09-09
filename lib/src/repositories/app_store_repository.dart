import 'package:tartlabsstore/src/responses/app_response.dart';
import 'package:tartlabsstore/src/utils/dio_helper.dart';
import 'package:tartlabsstore/src/utils/http_urls.dart';

class AppStoreRepository {
  static Future<AppResponse> fetchApps() async {
    final response = await dio.get(HttpUrls.GET_ALL_APPS);

    final data = AppResponse.fromJson(response?.data);

    return data;
  }
}
