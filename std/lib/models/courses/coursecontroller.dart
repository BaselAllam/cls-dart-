import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert';
import 'package:std/models/courses/coursemodel.dart';
import 'package:std/models/global.dart';


mixin CourseController on Model{

  Global _global = Global();

  List<Course> allCourses = [];

  bool _isGetCoursesLoading = false;
  bool get isGetCoursesLoading => _isGetCoursesLoading;

  bool _isDeleteCoursesLoading = false;
  bool get isDeleteCoursesLoading => _isDeleteCoursesLoading;


  getCourses() async {

    _isGetCoursesLoading = true;
    notifyListeners();

    http.Response _response = await http.get(Uri.parse('${_global.domain}/courses.json'));

    var _data = json.decode(_response.body);

    _data.forEach((x, i) {
      Course _newCourse = Course.fromJson(i, x);
      allCourses.add(_newCourse);
    });

    _isGetCoursesLoading = false;
    notifyListeners();
  }

  Future<bool> deleteCourse(String courseId) async {

    _isDeleteCoursesLoading = true;
    notifyListeners();

    http.Response _response = await http.delete(Uri.parse('${_global.domain}/courses/$courseId.json'));

    if(_response.statusCode == 200){
      allCourses.removeWhere((Course course) {
        return course.id == courseId;
      });
      _isDeleteCoursesLoading = false;
      notifyListeners();
      return true;
    }else{
      _isDeleteCoursesLoading = false;
      notifyListeners();
      return false;
    }
  }

}



// Object | Json

// Object to Json => encode

// Json to Object => decode


// Model => Inherite from to be able to share data and notifylisteners
// ScopedModelDecendent => Parent for any widget that wants to liseten to changes and acces data from controller
// ScopedModel => Top of app tree to can pass data to all children