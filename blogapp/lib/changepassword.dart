import 'package:flutter/material.dart';
import 'package:blogapp/second.dart';
class Secondy extends StatefulWidget {
  const Secondy({super.key});

  @override
  State<Secondy> createState() => _SecondyState();
}

class _SecondyState extends State<Secondy> {
  final TextEditingController _controllery1 = TextEditingController();
  final TextEditingController _controllery2 = TextEditingController();
  bool _validatey1 = false;
  bool _validatey2 = false;
  bool _isValidy = false;
  String _errorMessagey = '';
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
                "Change Password",
                style: TextStyle(fontSize: 50),
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
                      controller: _controllery1,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "Change Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        errorText: _validatey1 ? "Value Can't Be Empty" : null,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _controllery2,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "Confirm Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        errorText: _validatey2 ? "Value Can't Be Empty" : null,
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    _isValidy
                        ? const Text('Successfully Saved',
                        style: TextStyle(color: Colors.green))
                        : Text("$_errorMessagey",
                        style: const TextStyle(color: Colors.red)),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: 400,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            if (_isValidy ==true) {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
                            }
                            else{
                              setState(() {

                                _validatey1 = _controllery1.text.isEmpty;
                                _validatey2 = _controllery2.text.isEmpty;
                                _isValidy = _validatePassword(_controllery2.text);


                              });
                            }


                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green)),
                          child: const Text(
                            "Save",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
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
    _errorMessagey = '';

    // Password length greater than 6
    if (password.length < 6) {
      _errorMessagey += 'Password must be longer than 6 characters.\n';
    }
    // Contains at least one lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) {
      _errorMessagey += 'Lowercase letter is missing.\n';
    }
    // Contains at least one special character
    if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      _errorMessagey += 'Special character is missing.\n';
    }

    // If there are no error messages, the password is valid
    return _errorMessagey.isEmpty;
  }
}


