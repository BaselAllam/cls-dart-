import 'package:std/models/material/materialmodel.dart';



class Course{

  String courseName;
  String outline;
  int duration;
  String startDate;
  String endDate;
  int sessionDuration;
  int price;
  // Material material;

  Course(this.courseName, this.outline, this.duration, this.startDate, this.endDate, this.sessionDuration, this.price);


  factory Course.fromJson(Map<String, dynamic> i) {
    return Course(
      i['courseName'],
      i['outline'],
      i['duration'],
      i['startDate'],
      i['endDate'],
      i['sessionDuration'],
      i['price'],
      // i['material']
    );
  }

}