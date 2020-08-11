import 'package:flutter/material.dart';
import 'package:hawkers/Screens/LoginScreen.dart';
import 'package:hawkers/Screens/Registration.dart';
import 'package:hawkers/Screens/Otp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hawkers',
      theme: ThemeData(

        primarySwatch: Colors.green,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:Login(),
      routes: {
        Otp.routeName: (ctx) => Otp(),
        Login.routeName: (ctx) => Login(),
        Registration.routeName: (ctx) => Registration(),


      },
    );
  }
}
