import 'package:flutter/material.dart';
import 'package:flutter_application_qays/screen/SignUpScreen.dart';
import 'package:flutter_application_qays/screen/welcomescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}