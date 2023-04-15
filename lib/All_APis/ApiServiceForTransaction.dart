

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_seller_side/Models/Orders.dart';
import 'package:technician_seller_side/Models/SellerInfoGet.dart';
import 'package:technician_seller_side/Models/SellerLogOut.dart';
import 'package:technician_seller_side/Models/SellerSignIn.dart';
import 'package:technician_seller_side/Models/Transaction.dart';
import 'dart:convert';
import '../Models/SellerSignUp.dart';
import '../const.dart';

class ApiServiceForTransaction{
  static Future<Transaction> transaction(Map<String, dynamic> body) async {
    final prefs = await SharedPreferences.getInstance();
    String token=prefs.getString('token').toString();
    String id=prefs.getString('id').toString();
    String URL = "${baseUrl}transactions";
    final response = await http.post(Uri.parse(URL),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },body: json.encode(body));
    final String res = response.body;
    if (res != 'null') {
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        return Transaction.fromJson(jsonData);
      } catch (e) {
        print(e.toString());
      }
    }
    return Transaction();
  }
}