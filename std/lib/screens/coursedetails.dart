import 'package:flutter/material.dart';
import 'package:std/demodata.dart';
import 'package:std/theme/sharedcolor.dart';
import 'package:std/theme/sharedtextstyle.dart';




class CourseDetails extends StatefulWidget {

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
                height: MediaQuery.of(context).size.height/3,
                color: iconBackgroundColor,
                alignment: Alignment.center,
                child: ListTile(
                  leading: Container(
                      width: MediaQuery.of(context).size.width/3,
                      height: 220.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(data![0]!['img']),
                          fit: BoxFit.fill
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  title: Text(
                    'Course Name\n 30-50 Hour\n Course Description',
                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                height: MediaQuery.of(context).size.height/2.3,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3.5,
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 5.0,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.play_arrow, color: iconBackgroundColor, size: 25.0),
                        title: Text(
                          'Session 1',
                          style: headLineTextStyle,
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}