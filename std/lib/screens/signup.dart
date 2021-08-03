import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:std/models/global.dart';
import 'package:std/theme/sharedcolor.dart';
import 'package:std/theme/sharedtextstyle.dart';
import 'package:std/widgets/field.dart';
import 'package:std/widgets/snack.dart';




class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController userNameController = TextEditingController();

GlobalKey<FormState> emailKey = GlobalKey<FormState>();
GlobalKey<FormState> userNamekey = GlobalKey<FormState>();
GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String gender = '';

DateTime pickedDate = DateTime(1980);

String pickedImage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: backgroundColor,
        title: Text(
          'Welcome!',
          style: headLineTextStyle,
        ),
        iconTheme: IconThemeData(color: buttonColor, size: 20.0),
      ),
      body:  Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/3,
                    width: MediaQuery.of(context).size.width/1.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(pickedImage.isEmpty ? 'assets/defaultimage.jpg' : pickedImage),
                        fit: BoxFit.fill
                      ),
                      shape: BoxShape.circle
                    ),
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: Icon(Icons.add_a_photo),
                      color: Colors.black,
                      iconSize: 20.0,
                      onPressed: () {
                        Global _global = Global();
                        setState(() {
                          pickedImage = _global.pickImage(ImageSource.camera);
                        });
                      }
                    ),
                  ),
                ],
              ),
              field('Email Address', Icons.email, TextInputType.emailAddress, false, emailController, emailKey),
              field('User Name', Icons.email, TextInputType.text, false, userNameController, userNamekey),
              field('Password', Icons.lock, TextInputType.text, true, passwordController, passwordKey),
              item(
                'Gender',
                gender,
                PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<String>>[
                      PopupMenuItem(
                        child: Text('Male'),
                        value: 'Male'
                      ),
                      PopupMenuItem(
                        child: Text('FeMale'),
                        value: 'FeMale'
                      ),
                    ];
                  },
                  icon: Icon(Icons.arrow_drop_down, color: buttonColor, size: 25.0),
                  onSelected: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
              ),
              item(
                'BirthData',
                '${pickedDate.toString().substring(0, 10)}',
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  color: buttonColor,
                  iconSize: 25.0,
                  onPressed: () async {
                    DateTime? _pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1980),
                      lastDate: DateTime(2010),
                      initialDate: DateTime(1980),
                    );
                    setState(() {
                      pickedDate = _pickedDate!;
                    });
                  }
                ),
              ),
              Column(
                children: [
                  TextButton(
                    child: Text(
                      'Signup',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                    ),
                    onPressed: () {
                      if(!_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(snack('Email Field Required', Colors.red));
                      }else{
                        Global _global = Global();
                        _global.saveDataLocal('email', emailController.text);
                        Navigator.pushReplacementNamed(context, 'BottomNavBar');
                      }
                    },
                  ),
                ],
              ),
              InkWell(
                child: Text(
                  '  \n Have an Account? Login',
                  style: TextStyle(color: buttonColor, fontSize: 20.0),
                ),
                onTap: () {
                  Navigator.pop(context);},
              ),
            ],
          ),
        )
      ),
    );
  }
  item(String title, String subtitle, Widget trailing) {
    return ListTile(
      title: Text(
        '$title',
        style: headLineTextStyle,
      ),
      subtitle: Text(
        '$subtitle',
        style: subLineTextStyle
      ),
      trailing: trailing
    );
  }
}