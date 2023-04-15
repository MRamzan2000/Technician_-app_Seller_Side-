import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../const.dart';
import 'ApiServiceForGettingUserInfo.dart';
import 'ApiServiceForSignup.dart';



class ApiServiceForSellerUpdateType {
  static Future<String> updateType(Map<String, dynamic>  body) async {
    final prefs = await SharedPreferences.getInstance();
    String id=prefs.getString('id').toString();
    String token=prefs.getString('token').toString();
    String URL = "${baseUrl}seller/$id/type";
    final response = await http.put(Uri.parse(URL),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },body: json.encode(body));
    final String res = response.body;
    if (res != 'null') {
      print(res);
      try {
        if(response.statusCode==404){
          return "Seller not found";
        }
        if(response.statusCode==200){
          await ApiServiceForGettingUserInfo.GetUserInfo();
          return "Seller type updated successfully";
        }
        if(response.statusCode==500){
          final jsonData = json.decode(res) as Map<String, dynamic>;
          return jsonData['error'];
        }
      } catch (e) {
        print(e.toString());
      }
    }
    return "Error";
  }
}