
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:demoa1/homeScreen.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home:  SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) =>  HomeScreen()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() =>  _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    return Timer(
        Duration(seconds: 2),
            () => Navigator.of(context).pushReplacementNamed('/HomeScreen')
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.blue[400]),
          child: Center(
            child:  Image.asset('images/logo.png'),
          )
          ,)
    );
  }
}

