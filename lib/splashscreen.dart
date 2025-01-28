import 'package:contactf/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()),
      );
    });
    return Scaffold(
      backgroundColor: Color(0xff29384D),
      body: Center(
        child: RouteImage(180,60),
      )
    );
  }
}
Widget RouteImage(double width, double height) {
  return Image(
    image: AssetImage('assets/images/img.png'),
    width: width,
    height: height,
    fit: BoxFit.cover,
  );
}