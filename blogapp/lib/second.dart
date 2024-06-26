import 'package:flutter/material.dart';
import 'package:blogapp/registerpage.dart';
import 'package:blogapp/otpverify.dart';
import 'package:blogapp/otpforhomepage.dart';




class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  bool _validate1 = false;
  bool _validate2 = false;
  bool _isValid = false;
  String _errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/backy.jpg"),
                fit: BoxFit.cover,
                opacity: 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                "Login Page",
                style: TextStyle(fontSize: 50),
              ),
            ),
            const FlutterLogo(
              size: 50,
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
                        prefixIcon: const Icon(Icons.account_circle_outlined),
                        hintText: "Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        errorText: _validate1 ? "Value Can't Be Empty" : null,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _controller2,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        errorText: _validate2 ? "Value Can't Be Empty" : null,
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
                      height: 10,
                    ),
                    SizedBox(
                        width: 400,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            if (_isValid ==true) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OtpPageScreen()));
                            }
                            else{
                              setState(() {
                                _validate1 = _controller1.text.isEmpty;
                                _validate2 = _controller2.text.isEmpty;
                                _isValid = _validatePassword(_controller2.text);


                              });
                            }


                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green)),
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      child: const Text("Register a new account?"),
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>thatA())),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      child: const Text("Forget Password?"),
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>OtpScreen())),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
    // Contains at least one lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) {
      _errorMessage += 'Lowercase letter is missing Or ';
    }
    // Contains at least one special character
    if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      _errorMessage += 'Special character is missing ';
    }

    // If there are no error messages, the password is valid
    return _errorMessage.isEmpty;
  }
}


