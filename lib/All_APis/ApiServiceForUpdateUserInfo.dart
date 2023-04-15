
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_seller_side/Models/Orders.dart';
import 'package:technician_seller_side/Models/SellerInfoGet.dart';
import 'package:technician_seller_side/Models/SellerLogOut.dart';
import 'package:technician_seller_side/Models/SellerSignIn.dart';
import 'dart:convert';
import '../Models/SellerSignUp.dart';
import '../const.dart';
import 'ApiServiceForGettingUserInfo.dart';


class ApiServiceForUpdateUserInfo {
  static Future<UserInfo> UpdateUserInfo(Map<String, dynamic> body) async {
    final prefs = await SharedPreferences.getInstance();
    String id=prefs.getString('id').toString();
    String token=prefs.getString('token').toString();
    String URL = "${baseUrl}updateseller/$id";
    final response = await http.put(Uri.parse(URL),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },body: json.encode(body));
    final String res = response.body;
    if (res != 'null') {
      try {
        await ApiServiceForGettingUserInfo.GetUserInfo();
        final jsonData = json.decode(res) as Map<String, dynamic>;
        return UserInfo.fromJson(jsonData);
      } catch (e) {
        print(e.toString());
      }
    }
    return UserInfo();
  }
}