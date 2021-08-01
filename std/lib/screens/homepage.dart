import 'package:flutter/material.dart';
import 'package:std/demodata.dart';
import 'package:std/theme/sharedcolor.dart';
import 'package:std/theme/sharedtextstyle.dart';
import 'package:std/widgets/categoryWidget.dart';
import 'package:std/widgets/field.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

TextEditingController searchController = TextEditingController();

GlobalKey<FormState> searchKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double firstContainerHeight = MediaQuery.of(context).size.height/2.3;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                color: buttonColor,
                height: firstContainerHeight,
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '   Welcome Bassel\n',
                      style: headLineTextStyle
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                      ),
                      child: field('Search', Icons.search, TextInputType.text, false, searchController, searchKey),
                    ),
                  ],
                )
              ),
              Positioned(
                top: MediaQuery.of(context).size.height/3.2,
                right: 0.0,
                left: 0.0,
                height: MediaQuery.of(context).size.height/1.7,
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.83,
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 15.0,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: homeData!.length,
                    itemBuilder: (context, index) {
                      return CategoryWidget(homeData![index]!['img']!, homeData![index]!['txt']!, homeData![index]!['screen']);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}