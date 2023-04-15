

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_seller_side/Models/Orders.dart';
import 'package:technician_seller_side/Models/SellerInfoGet.dart';
import 'package:technician_seller_side/Models/SellerLogOut.dart';
import 'package:technician_seller_side/Models/SellerSignIn.dart';
import 'dart:convert';
import '../Models/SellerSignUp.dart';
import '../Models/Transactions.dart';
import '../const.dart';

class ApiServiceForTransactions{
  static Future<TransactionList> transactions() async {
    final prefs = await SharedPreferences.getInstance();
    String token=prefs.getString('token').toString();
    String id=prefs.getString('id').toString();
    String URL = "${baseUrl}getransactions/${id}";
    final response = await http.get(Uri.parse(URL),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final String res = response.body;
    if (res != null && res != 'null') {
      try {
        final jsonData = json.decode(res);
        if (jsonData is List) {
          return TransactionList.fromJson(jsonData);
        } else if (jsonData is Map<String, dynamic>) {
          if (jsonData.containsKey('message')) {
            final transactions = jsonData['message'] as List<dynamic>;
            return TransactionList.fromJson(transactions);
          }
        }
      } catch (e) {
        print(e.toString());
      }
    }

    return TransactionList();
  }
}