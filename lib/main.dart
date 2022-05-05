import 'package:buyer/home.dart';
import 'package:flutter/material.dart';
import 'package:buyer/splash screen.dart';
import 'package:buyer/profile.dart';
import 'package:buyer/register.dart';
import 'package:buyer/login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    onGenerateRoute: (RouteSettings settings){
      print(settings);
    },
    home: MyApp(),
    routes: <String, WidgetBuilder>{
      Register.route: (context) => Register(),
      Login.route: (context) => Login(),
      Home.route: (context) => Home(),
      Profile.route: (context) => Profile(),
    },
  ));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
          duration: 3000,
          splash: Image.asset(
            'assets/images/avshesh_logo_final.png',
            colorBlendMode: BlendMode.colorBurn,
            width: 1000,
            height: 1000,
          ),
          splashIconSize: double.maxFinite,
          nextScreen: Login(),
          splashTransition: SplashTransition.fadeTransition,
        )
    );
  }
}



