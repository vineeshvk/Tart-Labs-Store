import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static Future<void> saveToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("token", token);
  }

  static Future<String> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("token");
  }

  static Future<void> removeToken() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove("token");
  }
}
