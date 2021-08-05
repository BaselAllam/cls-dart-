import 'package:std/models/material/materialmodel.dart';



class Course{

  String id;
  String courseName;
  String outline;
  int duration;
  String startDate;
  String endDate;
  int sessionDuration;
  int price;
  Material material;

  Course(this.id, this.courseName, this.outline, this.duration, this.startDate, this.endDate, this.sessionDuration, this.price, this.material);


  factory Course.fromJson(Map<String, dynamic> i, String id) {
    Material material = Material(i['materialFile'], i['materialName']);
    return Course(
      id,
      i['courseName'],
      i['outline'],
      i['duration'],
      i['startDate'],
      i['endDate'],
      i['sessionDuration'],
      i['price'],
      material,
    );
  }

}