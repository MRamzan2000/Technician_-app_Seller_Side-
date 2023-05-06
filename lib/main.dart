import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_seller_side/Starting_Pages/First_Page.dart';

import 'Bottom/Bottom_bar.dart';
import 'Home Screens/Active_Orders.dart';
import 'Messages/Messages.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp(),));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String myid = "";

  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      myid = prefs.getString("id") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return  myid == ""?   First_Page()  : Bottom_bar();
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext?  context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}