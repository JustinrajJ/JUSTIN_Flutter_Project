import 'package:flutter/material.dart';

void main() {
  runApp(thatA());
}

class thatA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green, // Set the app's primary theme color
      ),
      debugShowCheckedModeBanner: false,
      home: PawordValidator(),
    );
  }
}

class PawordValidator extends StatefulWidget {
  @override
  _PawordValidatorState createState() => _PawordValidatorState();
}

class _PawordValidatorState extends State<PawordValidator> {
  TextEditingController edit1 = TextEditingController();
  TextEditingController edit2 = TextEditingController();
  TextEditingController edit3 = TextEditingController();
  TextEditingController edit4 = TextEditingController();
  TextEditingController edit5 = TextEditingController();
  TextEditingController edit6 = TextEditingController();
  bool control1 = false;
  bool control2 = false;
  bool control3 = false;
  bool control4 = false;
  bool control5 = false;
  bool control6 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
        decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage("images/backy.jpg"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: edit1,
              decoration: InputDecoration(hintText: " First name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.account_circle_outlined),
                  errorText: control1 ? "please fill the field" : null),

            ),
            SizedBox(height: 10,),
            TextField(
              controller: edit2,
              decoration: InputDecoration(hintText: "Surname",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.account_circle_outlined),
                  errorText: control2 ? "please fill the field" : null),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: edit3,
              decoration: InputDecoration(hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.lock),
                  errorText: control3 ? "please fill the field" : null),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: edit4,
              decoration: InputDecoration(hintText: "Confirm password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.lock),
                  errorText: control4 ? "please fill the field" : null),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: edit5,
              decoration: InputDecoration(hintText: "E-mail id",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.email),
                  errorText: control5 ? "please fill the field" : null),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: edit6,
              decoration: InputDecoration(hintText: "Mobile number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.phone),
                  errorText: control6 ? "please fill the field" : null),
            ),
            SizedBox(height: 20,),

            Container(width: 400,
                height: 50, child: TextButton(
                  onPressed: () {
                    setState(() {
                      control1 = edit1.text.isEmpty;
                      control2 = edit2.text.isEmpty;
                      control3 = edit3.text.isEmpty;
                      control4 = edit4.text.isEmpty;
                      control5 = edit5.text.isEmpty;
                      control6 = edit6.text.isEmpty;
                    });
                  },
                  child: Text("Register",
                    style: TextStyle(fontSize: 20, color: Colors.white),),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green)),))
          ],),
      ),),
    );
  }
}