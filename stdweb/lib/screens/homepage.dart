import 'package:flutter/material.dart';
import 'package:stdweb/demodata.dart';
import 'package:stdweb/theme/sharedcolor.dart';
import 'package:stdweb/theme/sharedtextstyle.dart';
import 'package:stdweb/widgets/categoryWidget.dart';
import 'package:stdweb/widgets/field.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

TextEditingController searchController = TextEditingController();

GlobalKey<FormState> searchKey = GlobalKey<FormState>();

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
                itemCount: homeData!.length,
                itemBuilder: (context, index) {
                  return CategoryWidget(homeData![index]!['img']!, homeData![index]!['txt']!, homeData![index]!['screen']);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}