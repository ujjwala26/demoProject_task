import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _isLoggedInKey = 'isLoggedIn';

  static const String _userIdKey = 'user_id';
  static const String _userNameKey = 'user_name';
  static const String _emailKey = 'email';
  static const String _contactKey = 'contact_no';
  static const String _addressKey = 'address';

  static const String _userKey = 'user';

  static const String _profileImageKey = 'profile_image';

  static Future<void> saveLoginData({
    required String accessToken,
    required String refreshToken,
    required String userId,
    required String userName,
    required String email,
    required String contactNo,
    required String address,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_accessTokenKey, accessToken);
    await prefs.setString(_refreshTokenKey, refreshToken);
    await prefs.setBool(_isLoggedInKey, true);

    await prefs.setString(_userIdKey, userId);
    await prefs.setString(_userNameKey, userName);
    await prefs.setString(_emailKey, email);
    await prefs.setString(_contactKey, contactNo);
    await prefs.setString(_addressKey, address);
  }
  
  static Future<void> savePartialUserData({
  required String email,
  required String accessToken,
  required String refreshToken,
}) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_emailKey, email);
  await prefs.setString(_accessTokenKey, accessToken);
  await prefs.setString(_refreshTokenKey, refreshToken);
}

static Future<void> saveUserData({required Map<String, dynamic> user}) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_userKey, jsonEncode(user));
}

static Future<Map<String, dynamic>> getUserData() async {
  final prefs = await SharedPreferences.getInstance();
  return Map<String, dynamic>.from(jsonDecode(prefs.getString(_userKey) ?? '{}'));
}


static Future<void> saveEmail(String email) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_emailKey, email);
}


static Future<void> saveProfileImagePath(String? path) async {
  final prefs = await SharedPreferences.getInstance();
  if (path == null || path.isEmpty) {
    await prefs.remove(_profileImageKey);
  } else {
    await prefs.setString(_profileImageKey, path);
  }
}

static Future<String?> getProfileImagePath() async {
  final prefs = await SharedPreferences.getInstance();
  final p = prefs.getString(_profileImageKey);
  return (p == null || p.isEmpty) ? null : p;
}


static Future<void> setLoggedIn(bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(_isLoggedInKey, value);
}


  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }
  static Future<void> saveUserName( {required String userName}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userNameKey,userName);
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshTokenKey);
  }

  
  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey);
  }

  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_emailKey);
  }

  static Future<String?> getContactNo() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_contactKey);
  }

  static Future<String?> getAddress() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_addressKey);
  }

 
  static Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  
  static Future<void> clearLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
