import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../const.dart';

class ApiServiceForCancelOrders {
  static Future<bool> cancel(String orderid) async {
    final prefs = await SharedPreferences.getInstance();
    String token=prefs.getString('token').toString();
    String URL = "${baseUrl}orders/$orderid/cancell";
    final response = await http.put(Uri.parse(URL),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final String res = response.body;
    if (res != 'null') {
      try {
        final jsonData = json.decode(res);
        if(jsonData['message']=='Order successfully cancelled'){
          return true;
        }
      } catch (e) {
        print(e.toString());
      }
    }
    return false;
  }
}