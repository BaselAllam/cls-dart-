import 'package:flutter/material.dart';
import 'package:std/screens/bottomnavbar.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavBar(),
      debugShowCheckedModeBanner: false
    );
  }
}