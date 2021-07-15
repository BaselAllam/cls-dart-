import 'package:flutter/material.dart';
import 'package:std/theme/sharedtextstyle.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff4ceb7),
        title: Text(
          'STD',
          style: headLineTextStyle
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      '  text1',
                      style: headLineTextStyle,
                    ),
                    Text(
                      '  Tex2',
                      style: subLineTextStyle,
                    ),
                  ],
                ),
                Icon(Icons.ac_unit, color: Colors.red, size: 20.0)
              ]
            ),
            ListTile(
              title: Text(
                'text1',
                style: headLineTextStyle,
              ),
              subtitle: Text(
                'Tex2',
                style: subLineTextStyle,
              ),
              trailing: Icon(Icons.ac_unit, color: Colors.red, size: 20.0)
            ),
          ],
        ),
      ),
    );
  }
}