import 'package:blogapp/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class OtpPageScreen extends StatefulWidget {
  @override
  _OtpPageScreenState createState() => _OtpPageScreenState();
}

class _OtpPageScreenState extends State<OtpPageScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();


  String _verificationId = '';

  Future _verifyPhoneNumber() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: _phoneNumberController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          print('Phone number automatically verified and user signed in: ${_auth.currentUser!.uid}');
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Phone number verification failed: $e');
        },
        codeSent: (String verificationId, int? resendToken) {
          print('Code sent to ${_phoneNumberController.text}');
          _verificationId = verificationId;
          print(_verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
        timeout: const Duration(seconds: 120),
      );
    } catch (e) {
      print('Error during phone number verification: $e');
    }
  }

  Future<void> _verifyPageOtp() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _otpController.text,
      );

      await _auth.signInWithCredential(credential);
      print('User signed in: ${_auth.currentUser!.uid}');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home()));
    } catch (e) {
      print('Error during OTP verification: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/backy.jpg"),fit: BoxFit.cover)),
            child:Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(hintText: "Phone Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),),),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _verifyPhoneNumber,
                    child: Text('Send OTP'),
                  ),
                  SizedBox(height: 32.0),
                  TextField(
                    controller: _otpController,
                    decoration: InputDecoration(hintText: "OTP",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),),),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _verifyPageOtp,
                    child: Text('Verify OTP'),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}