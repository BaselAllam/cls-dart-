import 'package:flutter/material.dart';
import 'package:std/screens/homepage.dart';
import 'package:std/screens/more.dart';
import 'package:std/screens/profile.dart';
import 'package:std/theme/sharedcolor.dart';



class BottomNavBar extends StatefulWidget {

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

List<Widget> screens = [
  HomePage(), Profile(), More()
];

int current = 0;

int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: buttonColor, size: 20.0),
        unselectedIconTheme: IconThemeData(color: subButtonColor, size: 20.0),
        selectedLabelStyle: TextStyle(color: buttonColor, fontSize: 15.0),
        unselectedLabelStyle: TextStyle(color: subButtonColor, fontSize: 15.0),
        selectedItemColor: buttonColor,
        unselectedItemColor: subButtonColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert),
            label: 'More'
          ),
        ],
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
      ),
      body: screens[current],
    );
  }
}