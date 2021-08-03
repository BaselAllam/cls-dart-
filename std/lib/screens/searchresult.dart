import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:std/models/courses/coursecontroller.dart';
import 'package:std/screens/enrolledcourses.dart';
import 'package:std/screens/newcourses.dart';
import 'package:std/theme/sharedcolor.dart';
import 'package:std/theme/sharedtextstyle.dart';



class SearchResult extends StatefulWidget {

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> with TickerProviderStateMixin {

TabController? tabController;

@override
void initState() {
  tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Results',
          style: headLineTextStyle
        ),
        iconTheme: IconThemeData(color: buttonColor),
        backgroundColor: backgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size(0.0, 40.0),
          child: TabBar(
            controller: tabController,
            tabs: [
              Text('Enrolled'), Text('New Courses')
            ],
            labelColor: buttonColor,
            unselectedLabelColor: subButtonColor,
            labelStyle: headLineTextStyle,
            unselectedLabelStyle: subLineTextStyle,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backgroundColor,
              border: Border.all(color: buttonColor, width: 1.5)
            ),
          ),
        ),
      ),
      body: ScopedModelDescendant(
        builder: (context, index, CourseController model) {
          return TabBarView(
            controller: tabController,
            children: [
              EnrolledCourse(),
              NewCourses(model)
            ],
          );
        }
      )
    );
  }
}