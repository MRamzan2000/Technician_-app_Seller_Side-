
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_seller_side/Models/Orders.dart';
import 'package:technician_seller_side/Models/SellerInfoGet.dart';
import 'package:technician_seller_side/Models/SellerLogOut.dart';
import 'package:technician_seller_side/Models/SellerSignIn.dart';
import 'dart:convert';
import '../Models/SellerSignUp.dart';
import '../const.dart';


class ApiServiceForGettingUserInfo {
  static Future<UserInfo> GetUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    String id=prefs.getString('id').toString();
    String token=prefs.getString('token').toString();
    String URL = "${baseUrl}seller/$id";
    final response = await http.get(Uri.parse(URL),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final String res = response.body;
    print(res);
    if (res != 'null') {
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('firstname', jsonData['firstname']);
        prefs.setString('lastname', jsonData['lastname']);
        prefs.setString('email', jsonData['email']);
        prefs.setString('phonenumber', jsonData['phonenumber']);
        prefs.setString('city', jsonData['city']);
        prefs.setString('dateofbirth', jsonData['dateofbirth']);
        prefs.setString('createdAt', jsonData['createdAt']);
        prefs.setString('type', jsonData['type']);
        return UserInfo.fromJson(jsonData);
      } catch (e) {
        print(e.toString());
      }
    }
    return UserInfo();
  }
}