import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:std/models/global.dart';
import 'package:std/theme/sharedcolor.dart';
import 'package:std/theme/sharedtextstyle.dart';




class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

TextEditingController userNameController = TextEditingController();
TextEditingController emailController = TextEditingController();

bool enabled = false;

String pickedImage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0.0,
        title: Text(
          'Profile',
          style: headLineTextStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            profileImage(),
            field('User Name', Icons.account_circle, TextInputType.name, userNameController),
            field('Email', Icons.email, TextInputType.emailAddress, emailController),
            Column(
              children: [
                TextButton(
                  child: Text(
                    enabled == false ?
                    'Edit Data' : 'Update Data',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      enabled = !enabled;
                    });
                  },
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
  profileImage() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/4,
          width: MediaQuery.of(context).size.width/2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(pickedImage.isEmpty ? 'assets/defaultimage.jpg' : pickedImage),
            )
          ),
          alignment: Alignment.center,
          child: IconButton(
            icon: Icon(enabled == false ? Icons.add_a_photo : Icons.done),
            color: Colors.white,
            iconSize: 35.0,
            onPressed: () {
              if(enabled == true) {
                Global _global = Global();
                setState(() {
                  pickedImage = _global.pickImage(ImageSource.gallery);
                });
              }
            },
          ),
        ),
      ],
    );
  }
  field(String label, IconData icon, TextInputType type, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: subLineTextColor, width: 1.5)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: subLineTextColor, width: 1.5)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: subLineTextColor, width: 1.5)
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.grey, width: 1.5)
        ),
        prefixIcon: Icon(icon, color: buttonColor, size: 20.0),
        labelText: label,
        labelStyle: TextStyle(color: buttonColor, fontSize: 17.0),
      ),
      keyboardType: type,
      enabled: enabled,
      controller: controller,
    ),
  );
}
}