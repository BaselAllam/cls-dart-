import 'package:flutter/material.dart';
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
            field('Email Address', Icons.email, TextInputType.emailAddress, false, emailController),
            field('Password', Icons.lock, TextInputType.text, true, passwordController),
            Column(
              children: [
                TextButton(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                  ),
                  onPressed: () {
                    if(emailController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(snack('Email Field Required', Colors.red));
                    }else if(passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(snack('Password Field Required', Colors.red));
                    }else{
                      Navigator.pushReplacementNamed(context, 'BottomNavBar');
                    }
                  },
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
        )
      ),
    );
  }
}