import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/ForgotPassword.dart';
import '../Models/earningmodel.dart';
import '../const.dart';


class ApiServiceForAmount {


  static Future<ForgotPasswordModel> updateamount(String orderId , String amount) async {
    final String URL = "${baseUrl}updateOrderAmount/${orderId}/${amount}";
    final response = await http.put(Uri.parse(URL), headers: {"Content-Type": "application/json"},);
    final String res = response.body;
    if (res != 'null') {
      final jsonData = json.decode(res) as Map<String, dynamic>;
      return ForgotPasswordModel.fromJson(jsonData);
    }
    return ForgotPasswordModel(message: 'An error occurred');
  }
  static Future<EarningModel> getEarnings(String sellerId ) async {
    final String URL = "${baseUrl}earnings/${sellerId}";
    final response = await http.get(Uri.parse(URL), headers: {"Content-Type": "application/json"},);
    final String res = response.body;
    if (res != 'null') {
      final jsonData = json.decode(res) as Map<String, dynamic>;
      return EarningModel.fromJson(jsonData);
    }
    return EarningModel(message: 'An error occurred');
  }

}