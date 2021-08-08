import 'package:flutter/material.dart';




double responsiveCategoryWidget(MediaQueryData data) {

  double _deviceHeight = data.size.height;

  if(_deviceHeight <= 540) {
    return 0.75;
  }else{
    return 0.83;
  }
}


double responsiveCourseWidget(MediaQueryData data) {

  double _deviceHeight = data.size.height;

  if(_deviceHeight <= 540) {
    return 100;
  }else{
    return 120;
  }
}