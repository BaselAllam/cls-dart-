import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:std/models/mainmodel.dart';
import 'package:std/theme/sharedcolor.dart';
import 'package:std/theme/sharedtextstyle.dart';



class Assignment extends StatefulWidget {

  final MainModel model;

  Assignment(this.model);

  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {

  TextEditingController searchController = TextEditingController();

@override
void initState() {
  widget.model.getCurrentPosition();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Course Location',
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
      ),
      body: ScopedModelDescendant(
        builder: (context, child, MainModel model) {
          if(model.isGetCurrentPositionLoading == true){
            return Center(child: CircularProgressIndicator());
          }else if(model.position == 0) {
            return Center(child: Text('Give us a permission'));
          }else if(model.position == 1) {
            return Center(child: Text('Enable Location Service'));
          }else if(model.position == 2) {
            return Center(child: Text('Some Thing Went Wrong'));
          }else{
          return Column(
            children: [
              SafeArea(
                top: true,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    labelStyle: headLineTextStyle,
                  ),
                  controller: searchController,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    model.searchLocation(searchController.text);
                  },
                ),
              ),
              Flexible(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(model.position.latitude, model.position.longitude),
                    zoom: 12
                  ),
                  mapType: MapType.normal,
                  myLocationButtonEnabled: true,
                  markers: Set<Marker>.from(model.markers),
                ),
              ),
            ],
          );
          } 
        }
      ),
    );
  }
}