import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<void> storeAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("auth_token", token);
  }

  static Future<String?> fetchAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("auth_token");
  }

  static Future<void> resetStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
