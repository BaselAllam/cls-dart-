import 'package:flutter/material.dart';
import 'package:std/screens/coursedetails.dart';
import 'package:std/theme/sharedcolor.dart';
import 'package:std/theme/sharedtextstyle.dart';



class CourseWidget extends StatefulWidget {

  final String img;
  final String courseName;
  final int price;

  CourseWidget(this.img, this.courseName, this.price);

  @override
  _CourseWidgetState createState() => _CourseWidgetState();
}

class _CourseWidgetState extends State<CourseWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {return CourseDetails();}));
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            Container(
              width: 100.0,
              height: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.img),
                  fit: BoxFit.fill
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 130.0,
              child: ListTile(
                title: Text(
                  '${widget.courseName} \n',
                  style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '30 H \n',
                          style: subLineTextStyle,
                        ),
                        Text(
                          '4.9 (20 Rating) \n',
                          style: subLineTextStyle,
                        ),
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Starts 20 Aug 2021 ',
                          style: TextStyle(color: subLineTextColor, fontSize: 15.0),
                        ),
                        Text(
                          '${widget.price.toString()} \$ ',
                          style: TextStyle(color: buttonColor, fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}