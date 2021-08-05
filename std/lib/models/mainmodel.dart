import 'package:scoped_model/scoped_model.dart';
import 'package:std/models/attendance/attendancecontroller.dart';
import 'package:std/models/courses/coursecontroller.dart';
import 'package:std/models/mapcontroller.dart';



class MainModel extends Model with CourseController, AttendanceController, MapController{}