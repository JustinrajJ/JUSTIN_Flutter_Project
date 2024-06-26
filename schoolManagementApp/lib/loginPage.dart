import 'package:flutter/material.dart';
import 'package:schoolmanagement/registerPage.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final TextEditingController _controller1 = TextEditingController();
  bool _validate1 = false;
  bool _isValid = false;
  String _errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/logo.png"),
              SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  "Login Now",
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Container(
                  child: Column(
                    children: [
                      TextField(
                        controller: _controller1,
                        decoration: InputDecoration(
                          hintText: "Enter the email,Wow ID",
                          labelText: "Enter the email,Wow ID",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          errorText: _validate1 ? "Value Can't Be Empty" : null,
                        ),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      _isValid
                          ? const Text('Password is valid!',
                          style: TextStyle(color: Colors.green))
                          : Text("$_errorMessage",
                          style: const TextStyle(color: Colors.red)),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_isValid ==true) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PasswordValidator()));
                              }
                              else{
                                setState(() {
                                  _validate1 = _controller1.text.isEmpty;
                                  _isValid = _validatePassword(_controller1.text);


                                });
                              }


                            },
                            style: ElevatedButton.styleFrom(minimumSize:Size(180, 40),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),backgroundColor:Colors.purple),
                            child:  Text(
                              "Login",
                              style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                          )),
                      SizedBox(
                         height: 20,
                      ),

                           Text("Or login with",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: 400,
                          height: 50,
                          child: ElevatedButton.icon(onPressed: (){},style: ElevatedButton.styleFrom(minimumSize:Size(180, 40),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),backgroundColor:Colors.white24), icon:Icon(Icons.facebook,color: Colors.blue,), label: Text("Login with Facebook", style: TextStyle(fontSize: 15, color: Colors.blue),)),),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: 400,
                          height: 50,
                          child: ElevatedButton.icon(onPressed: (){},style: ElevatedButton.styleFrom(minimumSize:Size(180, 40),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),backgroundColor:Colors.white24), icon:Image.asset("images/google.png",width: 20,), label: Text("Login with Google", style: TextStyle(fontSize: 15, color: Colors.blue),)),),
                      SizedBox(height: 10,),
                      InkWell(
                        child:Column(
                          children: [
                            Text("Don't have an",style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("account?",style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),

                      ),
                      SizedBox(height:30 ,),
                      SizedBox(
                          width: 400,
                          height: 50,
                          child:ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>PasswordValidator()));
                          },style: ElevatedButton.styleFrom(minimumSize:Size(180, 40),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),backgroundColor:Colors.purple),child: Text("Sign up", style: TextStyle(fontSize: 20, color: Colors.white),),)

                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validatePassword(String password) {
    // Reset error message
    _errorMessage = '';

    // Password length greater than 6
    if (password.length < 6) {
      _errorMessage += 'Password must be longer than 6 characters Or ';
    }
    return _errorMessage.isEmpty;
  }
}




// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:schoolmanagement/registerPage.dart';
//
// class Second extends StatefulWidget {
//   const Second({super.key});
//
//   @override
//   State<Second> createState() => _SecondState();
// }
//
// class _SecondState extends State<Second> {
//   final TextEditingController _controller1 = TextEditingController();
//   bool _validate1 = false;
//   bool _isValid = false;
//   String _errorMessage = '';
//
//   Future<void> _signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
//       final OAuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       await FirebaseAuth.instance.signInWithCredential(credential);
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//   Future<void> _signInWithFacebook() async {
//     try {
//       final LoginResult result = await FacebookAuth.instance.login();
//       if (result.status == LoginStatus.success) {
//         final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
//         await FirebaseAuth.instance.signInWithCredential(credential);
//       } else {
//         print(result.status);
//         print(result.message);
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset("images/logo.png"),
//               SizedBox(height: 20),
//               const Padding(
//                 padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                 child: Text(
//                   "Login Now",
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: _controller1,
//                       decoration: InputDecoration(
//                         hintText: "Enter the email,Wow ID",
//                         labelText: "Enter the email,Wow ID",
//                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                         errorText: _validate1 ? "Value Can't Be Empty" : null,
//                       ),
//                     ),
//                     const SizedBox(height: 1),
//                     _isValid
//                         ? const Text('Password is valid!', style: TextStyle(color: Colors.green))
//                         : Text("$_errorMessage", style: const TextStyle(color: Colors.red)),
//                     const SizedBox(height: 5),
//                     SizedBox(
//                       width: 400,
//                       height: 50,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (_isValid == true) {
//                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PasswordValidator()));
//                           } else {
//                             setState(() {
//                               _validate1 = _controller1.text.isEmpty;
//                               _isValid = _validatePassword(_controller1.text);
//                             });
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: Size(180, 40),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
//                           backgroundColor: Colors.purple,
//                         ),
//                         child: Text(
//                           "Login",
//                           style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Text("Or login with", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                     SizedBox(height: 20),
//                     SizedBox(
//                       width: 400,
//                       height: 50,
//                       child: ElevatedButton.icon(
//                         onPressed: _signInWithFacebook,
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: Size(180, 40),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
//                           backgroundColor: Colors.white24,
//                         ),
//                         icon: Icon(Icons.facebook, color: Colors.blue),
//                         label: Text("Login with Facebook", style: TextStyle(fontSize: 15, color: Colors.blue)),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     SizedBox(
//                       width: 400,
//                       height: 50,
//                       child: ElevatedButton.icon(
//                         onPressed: _signInWithGoogle,
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: Size(180, 40),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
//                           backgroundColor: Colors.white24,
//                         ),
//                         icon: Image.asset("images/google.png", width: 20),
//                         label: Text("Login with Google", style: TextStyle(fontSize: 15, color: Colors.blue)),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     InkWell(
//                       child: Column(
//                         children: [
//                           Text("Don't have an", style: TextStyle(fontWeight: FontWeight.bold)),
//                           Text("account?", style: TextStyle(fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     SizedBox(
//                       width: 400,
//                       height: 50,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordValidator()));
//                         },
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: Size(180, 40),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
//                           backgroundColor: Colors.purple,
//                         ),
//                         child: Text("Sign up", style: TextStyle(fontSize: 20, color: Colors.white)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   bool _validatePassword(String password) {
//     _errorMessage = '';
//     if (password.length < 6) {
//       _errorMessage += 'Password must be longer than 6 characters Or ';
//     }
//     return _errorMessage.isEmpty;
//   }
// }



