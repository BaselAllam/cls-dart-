import 'package:flutter/material.dart';
import 'package:std/screens/bottomnavbar.dart';
import 'package:std/screens/login.dart';
import 'package:std/screens/signup.dart';
import 'package:std/screens/splashscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        'BottomNavBar' : (context) => BottomNavBar(),
        'SignUp' : (context) => SignUp(),
        'login' : (context) => Login(),
      }
    );
  }
}