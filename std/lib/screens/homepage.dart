import 'package:flutter/material.dart';
import 'package:std/theme/sharedcolor.dart';
import 'package:std/theme/sharedtextstyle.dart';
import 'package:std/widgets/categoryWidget.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

Map<int, Map<String, String>>? data = {
  0 : {
    'img' : 'https://i.pinimg.com/originals/ae/5a/e1/ae5ae16a1f8bdad663c96a699d91e646.jpg',
    'txt' : 'Courses'
  },
  1 : {
    'img' : 'https://image.freepik.com/free-vector/education-online-concept-technology-e-books-internet-courses-graduation-process-illustration-style_126283-1688.jpg',
    'txt' : 'Attendance'
  },
  2 : {
    'img' : 'https://skillscouter.com/wp-content/uploads/2019/10/Screen-Shot-2019-10-08-at-15.26.38-pm.jpg',
    'txt' : 'Assignment'
  },
};

  @override
  Widget build(BuildContext context) {
    double firstContainerHeight = MediaQuery.of(context).size.height/3;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              color: buttonColor,
              height: firstContainerHeight,
              alignment: Alignment.centerLeft,
              child: Text(
                '   Welcome Bassel\n',
                style: headLineTextStyle
              )
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              height: MediaQuery.of(context).size.height - firstContainerHeight,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return CategoryWidget(data![index]!['img']!, data![index]!['txt']!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}