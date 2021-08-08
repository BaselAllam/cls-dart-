import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:std/models/mainmodel.dart';
import 'package:std/screens/bottomnavbar.dart';
import 'package:std/screens/login.dart';
import 'package:std/screens/signup.dart';
import 'package:std/screens/splashscreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

@override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MainModel(),
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          'BottomNavBar' : (context) => BottomNavBar(),
          'SignUp' : (context) => SignUp(),
          'login' : (context) => Login(),
        }
      ),
    );
  }
}






// Flutter 
    // Widget 
    // Data => State
            // State => Private Class
                // Can't be accessed or modified 
                    // can't share data between widgets

                // change => setState
                    // bad performance
                    // heavy cache 
                    // can't listen to this change ( notify lisetener )





    // State Managment
        // whatis mean by manage state ?
            // => 1 : sharing data around states
              //  2 : notify any listeners on the event


        // Types of State Managment
            // Low Level State Mangament
                // - setState
                // - Inhretied Widget
                // - Inhertied Model

            // State Mangment Approache
                // Scoped Model
                // Provider
                // BloC
                // Getx

        // Steps 
            // Model Definition
            // Controller Definition
            // Put all Together into Widgets




// HTTP :
    // Request
    // Response 

    // method ( get, post, put, delete )
    // url 
    // body ( recieve , send )
    // header ( en, token, json )