import 'package:tartlabsstore/src/responses/app_url_response.dart';
import 'package:tartlabsstore/src/utils/dio_helper.dart';
import 'package:tartlabsstore/src/utils/http_urls.dart';

class AppUrlRepository {
  static Future<AppUrlResponse> getAppUrl(int id) async {
    final response = await dio.get("${HttpUrls.GET_APP_URL}/$id");
    final data = AppUrlResponse.fromJson(response.data);

    return data;
  }
}
