import 'package:flutter/material.dart';


SnackBar snack(String content, Color color) {
  return SnackBar(
    backgroundColor: color,
    content: Text(content),
    duration: Duration(seconds: 4),
  );
}