import 'dart:convert';
import 'package:http/http.dart' as http;

class OtpService {
  static Future<Map<String, dynamic>> sendOtp(String phone) async {
    final response = await http.post(
      Uri.parse("http://3.110.154.53:8001/api/sendOTP/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"phone": phone}),
    );

    return {
      "success": response.statusCode == 200,
      "data": response.body,
    };
  }

  static Future<Map<String, dynamic>> verifyOtp(String phone, String otp) async {
    final response = await http.post(
      Uri.parse("http://3.110.154.53:8001/api/verifyOTP/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"phone": phone, "otp": otp}),
    );

    return {
      "success": response.statusCode == 200,
      "data": response.body,
    };
  }
}
