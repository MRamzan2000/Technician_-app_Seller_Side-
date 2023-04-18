
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_seller_side/Models/SellerLogOut.dart';
import 'package:technician_seller_side/Models/SellerSignIn.dart';
import 'dart:convert';
import '../Models/SellerSignUp.dart';
import '../const.dart';

class  ApiServiceForSignup {
  static Future<SellerSignUp> signup(Map<String, dynamic> body) async {
    const String URL = "${baseUrl}signup";
    final response = await http.post(
        Uri.parse(URL), headers: {"Content-Type": "application/json"},
        body: json.encode(body));
    final String res = response.body;
    // print(res);
    if (res != 'null') {
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        return SellerSignUp.fromJson(jsonData);
      } catch (e) {}
    }
    return SellerSignUp(message: 'An error occurred',);
  }

  static Future<SignInResponse> signin(Map<String, dynamic> body) async {
    const String URL = "${baseUrl}login";
    final response = await http.post(
        Uri.parse(URL), headers: {"Content-Type": "application/json"},
        body: json.encode(body));
    final String res = response.body;
    print(res);
    if (res != 'null') {
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', jsonData['token'].toString());
        await prefs.setString('id', jsonData['id'].toString());
        return SignInResponse.fromJson(jsonData);

      } catch (e) {}
    }
    return SignInResponse( riderId: null, token: null);

  }
  static Future<LogOutModel> Logout() async {
    final prefs = await SharedPreferences.getInstance();
    String id=prefs.getString('id').toString();
    String token=prefs.getString('token').toString();
    const String URL = "${baseUrl}seller/logout";
    final response = await http.put(
        Uri.parse(URL), headers:  {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
        body: json.encode({
          "sellerId" : id.toString()
        }));

    final String res = response.body;
    if (res != 'null') {
      try {
        print(res);
        final jsonData = json.decode(res) as Map<String, dynamic>;
        final prefs = await SharedPreferences.getInstance();
        prefs.remove('id');
        prefs.remove('token');
        return LogOutModel.fromJson(jsonData);
      } catch (e) {}
    }
    return LogOutModel( message: null, error: null);

  }


}






