import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs{
  static Future<void> saveTokens({required String access, required String refresh })async{
    

    SharedPreferences prefs= await SharedPreferences.getInstance();
    await prefs.setString('access_token', access);
    await prefs.setString('refresh_token', refresh);
    
 
  }
  
  static Future<String?> getAccessToken()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.getString('access_token');

  }
  static Future<String?> getRefreshToken()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.getString('refresh_token');

  }

  static Future <void> clearTokens()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');

  }
  static Future<bool>getLoginStatus()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;

  }

  static Future<void> clearLoginStatus()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');

  }
}