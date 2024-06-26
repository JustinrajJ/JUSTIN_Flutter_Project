import 'package:flutter/material.dart';
import 'package:tudusqflite/home.dart';

void main(){
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: todoStart()
  ));
}

class todoStart extends StatefulWidget {
  const todoStart({super.key});

  @override
  State<todoStart> createState() => _todoStartState();
}
TextEditingController control=TextEditingController();
class _todoStartState extends State<todoStart> {
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});  // Duration for the splash screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image:AssetImage("images/TODO.png",),fit:BoxFit.cover)
        ),
      ),
    );
  }
}