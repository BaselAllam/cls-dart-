import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:std/demodata.dart';
import 'package:std/models/courses/coursecontroller.dart';
import 'package:std/theme/sharedtextstyle.dart';
import 'package:std/widgets/coursewidget.dart';



class NewCourses extends StatefulWidget {

  final CourseController model;

  NewCourses(this.model);

  @override
  _NewCoursesState createState() => _NewCoursesState();
}

class _NewCoursesState extends State<NewCourses> {

@override
void initState() {
  widget.model.getCourses();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ScopedModelDescendant(
        builder: (context, child, CourseController model) {
          if(model.isGetCoursesLoading == true) {
            return Center(child: CircularProgressIndicator());
          }else if(model.allCourses.isEmpty) {
            return Center(child: Text('No Courses Found', style: headLineTextStyle));
          }else{
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: model.allCourses.length,
              itemBuilder: (context, index) {
                return CourseWidget(
                  'https://th.bing.com/th/id/R.bbb812c75c9aef68c67d71b6366c3817?rik=llhQIeCxmSbEng&pid=ImgRaw&r=0',
                  model.allCourses[index].courseName,
                  model.allCourses[index].price
                );
              },
            );
          }
        }
      )
    );
  }
}