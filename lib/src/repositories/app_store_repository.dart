import 'package:dio/dio.dart';
import 'package:tartlabsstore/src/models/app_model.dart';
import 'package:tartlabsstore/src/utils/api_endpoints.dart';
import 'package:tartlabsstore/src/utils/dio_helper.dart';
import 'package:tartlabsstore/src/utils/preference_helper.dart';

class AppStoreRepository {
  static Future<List<AppModel>> fetchApps() async {
    final token = await PreferenceHelper.getToken();
    final response = await dio.get(
      APIEndpoints.getAllApps,
      options: Options(
        headers: {"Authorization": "Bearer " + token},
      ),
    );

    List data = response?.data["apps"];
    final appList = data.map((e) => AppModel.fromJson(e)).toList();

    return appList;
  }
}
