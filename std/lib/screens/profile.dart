import 'package:flutter/material.dart';
import 'package:std/theme/sharedcolor.dart';
import 'package:std/theme/sharedtextstyle.dart';




class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0.0,
        title: Text(
          'Profile',
          style: headLineTextStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            profileImage()
          ],
        )
      ),
    );
  }
  profileImage() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/4,
          width: MediaQuery.of(context).size.width/2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage('https://avatars.githubusercontent.com/u/44323531?v=4'),
            )
          ),
          alignment: Alignment.center,
          child: Icon(Icons.add_a_photo, color: Colors.white, size: 35.0),
        ),
      ],
    );
  }
}