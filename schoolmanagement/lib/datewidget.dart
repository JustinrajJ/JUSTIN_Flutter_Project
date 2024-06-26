import 'package:flutter/material.dart';
import 'package:schoolmanagement/home.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {

  TextEditingController otpNumber=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 600,
                  child: Image.asset('images/otp.jpg',fit: BoxFit.cover,)),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                    border: const Border(
                      top: BorderSide(color: Colors.black, width: 4),
                    )),
                width:double.infinity,
                child:  Column(
                  children: [
                    const SizedBox(height: 10,),
                    const Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                            child: Text('OTP Verification',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          child:Text('Enter the OTP',style: TextStyle(fontWeight: FontWeight.w100,color: Colors.black),),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller:otpNumber,
                        decoration: InputDecoration(
                          hintText: 'Enter the OTP',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                              const BorderSide(color: Colors.purple, width: 2.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                              const BorderSide(color: Colors.purple, width: 2.0)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () {
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> home()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          minimumSize: const Size(300, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text(
                        'Verify code',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),

                  ],
                ),

              )
            ],
          ) ,
        ),
      ),
    );
  }
}