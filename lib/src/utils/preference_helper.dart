import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tartlabsstore/src/models/token_model.dart';

class PreferenceHelper {
  static Future<TokenModel> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.get("token");
    
    if (token?.isEmpty ?? true) return null;

    Map<String, dynamic> tokenMap = await jsonDecode(token);
    return TokenModel.fromJson(tokenMap);
  }

  static saveToken(TokenModel token) async {
    if (token == null) return;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", jsonEncode(token));
  }

  static Future<void> removeToken() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove("token");
  }
}
