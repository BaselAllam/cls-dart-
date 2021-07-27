import 'package:std/screens/assignment.dart';
import 'package:std/screens/attendance.dart';
import 'package:std/screens/searchresult.dart';

Map<int, Map<String, dynamic>>? data = {
  0 : {
    'img' : 'https://cdn.publish0x.com/prod/fs/images/a35bcf8433bbab9cfb7ea96687e320fffc2c9e36a3764334180aed1054e998e2.jpeg',
    'courseName' : 'Flutter',
    'price' : 200.5
  },
  1 : {
    'img' : 'https://i.ytimg.com/vi/AP4cKqfSlsE/hqdefault.jpg',
    'courseName' : 'Dart',
    'price' : 300.5
  },
  2 : {
    'img' : 'https://www.fossmint.com/wp-content/uploads/2020/03/Udemy-Advance-Python-Learning-Courses.png',
    'courseName' : 'Python',
    'price' : 500.5
  },
};



Map<int, Map<String, dynamic>>? homeData = {
  0 : {
    'img' : 'https://i.pinimg.com/originals/ae/5a/e1/ae5ae16a1f8bdad663c96a699d91e646.jpg',
    'txt' : 'Courses',
    'screen' : SearchResult()
  },
  1 : {
    'img' : 'https://image.freepik.com/free-vector/education-online-concept-technology-e-books-internet-courses-graduation-process-illustration-style_126283-1688.jpg',
    'txt' : 'Attendance',
    'screen' : Attendance()
  },
  2 : {
    'img' : 'https://skillscouter.com/wp-content/uploads/2019/10/Screen-Shot-2019-10-08-at-15.26.38-pm.jpg',
    'txt' : 'Assignment',
    'screen' : Assignment()
  },
};