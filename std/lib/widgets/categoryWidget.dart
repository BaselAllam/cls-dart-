import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:std/theme/sharedtextstyle.dart';



class CategoryWidget extends StatefulWidget {

  final String img;
  final String txt;

  CategoryWidget(this.img, this.txt);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}