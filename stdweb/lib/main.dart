import 'package:flutter/material.dart';
import 'package:stdweb/screens/bottomnavbar.dart';
import 'package:stdweb/screens/login.dart';
import 'package:stdweb/screens/signup.dart';
import 'package:stdweb/screens/splashscreen.dart';


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