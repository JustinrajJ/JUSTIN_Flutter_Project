import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projectone/main.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotohome();
  }
  gotohome()async{
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext)=>homePage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.black
        ),
        child: Center(
          child:Container(
            child: Image.asset("images/applogo.png",height: 130,width: 90,),
          ), // Replace with your splash screen content
        ),
      ),
    );
  }
}