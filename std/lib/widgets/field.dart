import 'package:flutter/material.dart';
import 'package:std/theme/sharedcolor.dart';



field(String label, IconData icon, TextInputType type, bool secure, TextEditingController controller, Key key) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      key: key,
      validator: (value) {
        if(value!.isEmpty) {
          return 'This field required';
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: subLineTextColor, width: 1.5)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: subLineTextColor, width: 1.5)
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.red, width: 1.5)
        ),
        prefixIcon: Icon(icon, color: buttonColor, size: 20.0),
        labelText: label,
        labelStyle: TextStyle(color: buttonColor, fontSize: 17.0),
        suffixIcon: secure == true ? IconButton(
          icon: Icon(Icons.remove_red_eye),
          color: Colors.grey,
          iconSize: 20.0,
          onPressed: () {
            secure = !secure;
          }
        ) : null,
      ),
      keyboardType: type,
      obscureText: secure,
      controller: controller,
    ),
  );
}