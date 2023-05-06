
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_seller_side/Models/Orders.dart';
import 'dart:convert';
import '../Models/SellerSignUp.dart';
import '../const.dart';

class ApiServiceForSellerOrders {
  static Future<OrderList> sellerOrders() async {
    final prefs = await SharedPreferences.getInstance();
    String id=prefs.getString('id').toString();
    String token=prefs.getString('token').toString();
    String URL = "${baseUrl}sellerOrders/$id";
    final response = await http.get(Uri.parse(URL),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final String res = response.body;
    if (res != 'null') {
      try {
        final jsonData = json.decode(res);
        if (jsonData is List) {
          return OrderList.fromJson(jsonData);
        } else if (jsonData is Map<String, dynamic>) {
          if (jsonData.containsKey('orders')) {
            final orders = jsonData['orders'] as List<dynamic>;
            return OrderList.fromJson(orders);
          }
        }
      } catch (e) {
        print(e.toString());
      }
    }
    return OrderList(orders: []);
  }
}