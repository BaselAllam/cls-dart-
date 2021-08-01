import 'package:flutter/material.dart';
import 'package:std/theme/sharedcolor.dart';
import 'package:std/theme/sharedtextstyle.dart';



class CategoryWidget extends StatefulWidget {

  final String img;
  final String txt;
  final Widget screen;

  CategoryWidget(this.img, this.txt, this.screen);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {

  bool attended = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(widget.txt == 'Attendance') {
          showModalBottomSheet(
            context: context,
            backgroundColor: backgroundColor,
            builder: (BuildContext context) {
              return Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      'Today Session',
                      style: headLineTextStyle,
                    ),
                    ListTile(
                      title: Text(
                        'Course Name',
                        style: headLineTextStyle,
                      ),
                      subtitle: Text(
                        '1 Aug 2021',
                        style: subLineTextStyle,
                      ),
                      trailing: Checkbox(
                        activeColor: Colors.green,
                        checkColor: Colors.white,
                        value: attended,
                        onChanged: (value) {
                          setState(() {
                            attended = value!;
                          });
                        },
                      ),
                    )
                  ],
                ),
              );
            }
          );
        }else{
        Navigator.push(context, MaterialPageRoute(builder: (_) {return widget.screen;}));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Image.network(widget.img, height: 150.0),
            Text(
              widget.txt,
              style: headLineTextStyle
            )
          ],
        )
      ),
    );
  }
}