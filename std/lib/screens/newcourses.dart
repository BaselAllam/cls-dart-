import 'package:flutter/material.dart';
import 'package:std/demodata.dart';
import 'package:std/widgets/coursewidget.dart';



class NewCourses extends StatefulWidget {

  @override
  _NewCoursesState createState() => _NewCoursesState();
}

class _NewCoursesState extends State<NewCourses> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: data!.length,
        itemBuilder: (context, index) {
          return CourseWidget(
            data![index]!['img'],
            data![index]!['courseName'],
            data![index]!['price'],
          );
        },
      )
    );
  }
}