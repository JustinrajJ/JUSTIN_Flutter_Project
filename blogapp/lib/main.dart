import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blogapp/second.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyC9pZi2lYfOyn4FixQQv45ksF6wsBOrE68',
      appId: '1:565790117632:android:daedb1a46e33353255ede5',
      messagingSenderId: '565790117632',
      projectId: 'otpandfirestore',
    ),
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignInPage(),
  ));
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/signinpagebg2.jpg"),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Everthing New",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const Text(
                    "Travel Blog",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 300,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>Second(),
                                  ),);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                              child: const Text(
                                "Sign In",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),

                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 40,
                          width: 300,
                          child: Container(
                              child: ElevatedButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Second()));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey),
                                child:const Text(
                                  "Sign In With Google",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),

                      ],
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );


  }
}
