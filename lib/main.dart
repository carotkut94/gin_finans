import 'package:flutter/material.dart';
import 'package:gin/ui/onboarding.dart';
void main() => runApp(BeginApp());

class BeginApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "ProductSans-Medium"
      ),
      home: OnBoarding(),
    );
  }
}