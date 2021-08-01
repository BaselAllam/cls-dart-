import 'package:flutter/material.dart';
import 'package:stdweb/theme/sharedcolor.dart';
import 'package:stdweb/theme/sharedtextstyle.dart';



class More extends StatefulWidget {

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {

final Map<int, Map<String, dynamic>> data = {
  0 : {
    'icon' : Icons.settings,
    'txt' : 'Settings'
  },
  1 : {
    'icon' : Icons.email,
    'txt' : 'Contact Us',
  },
  2 : {
    'icon' : Icons.info,
    'txt' : 'About Us'
  },
  3 : {
    'icon' : Icons.exit_to_app,
    'txt' : 'Log out'
  },
};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: backgroundColor,
        title: Text(
          'More',
          style: headLineTextStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(data[index]!['icon'], color: buttonColor, size: 25.0),
              title: Text(
                 data[index]!['txt'],
                 style: headLineTextStyle,
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: subButtonColor, size: 20.0),
            );
          },
        ),
      ),
    );
  }
}