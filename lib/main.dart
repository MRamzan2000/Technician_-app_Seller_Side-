import 'dart:io';

import 'package:flutter/material.dart';
import 'package:technician_seller_side/Starting_Pages/First_Page.dart';

import 'Messages/Messages.dart';
import 'Service App/Service_App.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return First_Page();
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext?  context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}