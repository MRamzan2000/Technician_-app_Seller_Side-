import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/ForgotPassword.dart';
import '../const.dart';


class ApiServiceForForgotPassword {
  static Future<ForgotPasswordModel> sendCodeToEmail(String email) async {
    const String URL = "${baseUrl}forgot-passwordc/email";
    final response = await http.post(Uri.parse(URL), headers: {"Content-Type": "application/json"}, body: json.encode({"email": email}));
    final String res = response.body;
    if (res != 'null') {
      final jsonData = json.decode(res) as Map<String, dynamic>;
      return ForgotPasswordModel.fromJson(jsonData);
    }
    return ForgotPasswordModel(message: 'An error occurred');
  }

  static Future<ForgotPasswordModel> verifyCode(Map<String, dynamic> body) async {
    const String URL = "${baseUrl}forgot-passwordc/code";
    final response = await http.post(Uri.parse(URL), headers: {"Content-Type": "application/json"}, body: json.encode(body));
    final String res = response.body;
    if (res != 'null') {
      final jsonData = json.decode(res) as Map<String, dynamic>;
      return ForgotPasswordModel.fromJson(jsonData);
    }
    return ForgotPasswordModel(message: 'An error occurred');
  }

  static Future<ForgotPasswordModel> changePassword(Map<String, dynamic> body) async {
    const String URL = "${baseUrl}forgot-passwordc/password";
    final response = await http.post(Uri.parse(URL), headers: {"Content-Type": "application/json"}, body: json.encode(body));
    final String res = response.body;
    if (res != 'null') {
      final jsonData = json.decode(res) as Map<String, dynamic>;
      return ForgotPasswordModel.fromJson(jsonData);
    }
    return ForgotPasswordModel(message: 'An error occurred');
  }
}