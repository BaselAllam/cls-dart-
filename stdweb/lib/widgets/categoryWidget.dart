import 'package:flutter/material.dart';
import 'package:stdweb/theme/sharedtextstyle.dart';



class CategoryWidget extends StatefulWidget {

  final String img;
  final String txt;
  final Widget screen;

  CategoryWidget(this.img, this.txt, this.screen);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {return widget.screen;}));
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