import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:std/models/global.dart';
import 'package:std/models/mainmodel.dart';
import 'package:std/theme/sharedcolor.dart';
import 'package:std/theme/sharedtextstyle.dart';
import 'package:std/widgets/field.dart';
import 'package:std/widgets/snack.dart';




class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

GlobalKey<FormState> emailKey = GlobalKey<FormState>();
GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      ),
      body: Container(
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
                        image: NetworkImage('https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg?size=338&ext=jpg'),
                        fit: BoxFit.fill
                      ),
                      shape: BoxShape.circle
                    ),
                  ),
                ],
              ),
              field('Email Address', Icons.email, TextInputType.emailAddress, false, emailController, emailKey),
              field('Password', Icons.lock, TextInputType.text, true, passwordController, passwordKey),
              Column(
                children: [
                  ScopedModelDescendant(
                    builder:  (context, child, MainModel model) {
                      return TextButton(
                        child: model.isUSerLoading == true ? Center(child: CircularProgressIndicator()) : Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                        ),
                        onPressed: () async {
                          if(!_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(snack('Some Fields Required', Colors.red));
                          }else{
                            bool _isValid = await model.signIn(emailController.text, passwordController.text);
                            if(_isValid == true) {
                              Global _global = Global();
                              _global.saveDataLocal('email', emailController.text);
                              Navigator.pushReplacementNamed(context, 'BottomNavBar');
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(snack('Inavlida Login', Colors.red));}
                          }
                        },
                      );
                    }
                  ),
                ],
              ),
              InkWell(
                child: Text(
                  '  \n Don\'t Have an Account? Signup',
                  style: TextStyle(color: buttonColor, fontSize: 20.0),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'SignUp');},
              ),
            ],
          ),
        )
      ),
    );
  }
}