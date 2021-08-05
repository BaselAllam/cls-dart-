import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'package:std/models/global.dart';
import 'dart:convert';


mixin AttendanceController on Model{

  Global _global = Global();

  bool _isAddAttendaceLoading = false;
  bool get isAddAttendaceLoading => _isAddAttendaceLoading;


  Future<bool> addAttendance(String courseId, bool attended, String userName, String date) async {

    _isAddAttendaceLoading = true;
    notifyListeners();

    Map<String, dynamic> _data = {
      'courseId' : courseId,
      'attended' : attended,
      'userName' : userName,
      'date' : date
    };

    http.Response _response = await http.post(
      Uri.parse('${_global.domain}/attendance.json'),
      body: json.encode(_data)
    );

    if(_response.statusCode == 200){
      _isAddAttendaceLoading = false;
      notifyListeners();
      return true;
    }else{
      _isAddAttendaceLoading = false;
      notifyListeners();
      return false;
    }

  }

}