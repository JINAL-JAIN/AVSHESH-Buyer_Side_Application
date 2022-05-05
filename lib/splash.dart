import 'package:buyer/home.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:splashscreen/splashscreen.dart';



class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SplashScreen(
          seconds: 4,
          navigateAfterSeconds: Home(),
          image: Image.asset(
            'assets/images/avshesh_logo_final.png',
            colorBlendMode: BlendMode.colorBurn,
            width: 300,
            height: 300,
          ),
          photoSize: 200.0,
          useLoader: false,
          title: Text('WELCOME!' ,style: TextStyle(fontSize: 25, color: Colors.green[700])),
        ),
      );
  }
}
