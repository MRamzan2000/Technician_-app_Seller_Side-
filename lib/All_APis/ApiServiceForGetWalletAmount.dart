

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_seller_side/Models/Orders.dart';
import 'package:technician_seller_side/Models/SellerInfoGet.dart';
import 'package:technician_seller_side/Models/SellerLogOut.dart';
import 'package:technician_seller_side/Models/SellerSignIn.dart';
import 'dart:convert';
import '../Models/SellerSignUp.dart';
import '../const.dart';

class ApiServiceForGetWalletAmount{
  static Future<String> getAmount() async {
    final prefs = await SharedPreferences.getInstance();
    String token=prefs.getString('token').toString();
    String id=prefs.getString('id').toString();
    String URL = "${baseUrl}wallet/$id";
    final response = await http.get(Uri.parse(URL),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final String res = response.body;
    if (res != 'null') {
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        if(jsonData.containsKey('balance')){
          print(jsonData['balance']);
          return jsonData['balance'];
        }
        else{
          return "0";
        }
      } catch (e) {
        print(e.toString());
      }
    }
    return "Error";
  }
}