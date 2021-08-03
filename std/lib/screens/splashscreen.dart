import 'dart:async';
import 'package:flutter/material.dart';
import 'package:std/models/global.dart';
import 'package:std/theme/sharedcolor.dart';



class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool? check;

  Global global = Global();

@override
void initState() {
  checkData();
  Timer(
    Duration(seconds: 5),
    () => Navigator.pushReplacementNamed(context, check == false ? 'login' : 'BottomNavBar')
  );
  super.initState();
}

checkData() async {
  bool? _check = await global.getLocalData('email');
  setState(() {
    check = _check;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/logo.jpg', height: MediaQuery.of(context).size.height/2.5,),
            CircularProgressIndicator(
              backgroundColor: backgroundColor,
              color: buttonColor,
            )
          ],
        ),
      ),
    );
  }
}