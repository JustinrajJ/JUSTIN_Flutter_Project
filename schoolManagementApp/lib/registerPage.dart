import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schoolmanagement/datewidget.dart';

class PasswordValidator extends StatefulWidget {
  @override
  _PasswordValidatorState createState() => _PasswordValidatorState();
}

class _PasswordValidatorState extends State<PasswordValidator> {

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
  bool acceptedTerms = false;

  @override
  void dispose() {
    edit4.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      setState(() {
        edit4.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
child:
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Column(
                    children: [
                      Image.asset("images/logo.png"),
                      Text(
                        "Register account",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue[900]),
                      ),
                      Row(
                        children: [
                          Text("Name"),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: edit1,
                              decoration: InputDecoration(
                                hintText: "First name",
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: edit2,
                              decoration: InputDecoration(
                                hintText: "Last name",
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text("E-mail"),
                        ],
                      ),
                      SizedBox(height: 5,),
                      TextField(
                        controller: edit3,
                        decoration: InputDecoration(
                          hintText: "abc@mail.com",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text("Date of Birth"),
                        ],
                      ),
                      SizedBox(height: 5,),
                      TextField(
                        controller: edit4,
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: 'Select your date of birth',
                          suffixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onTap: () => _selectDate(context),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text("Phone Number"),
                        ],
                      ),
                      SizedBox(height: 5,),
                          TextField(
                            controller: edit5,
                            keyboardType: TextInputType.number,
                            maxLength: 13,
                            decoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              hintText: 'XXXXXXXXXX',
                            ),
                          ),


                      SizedBox(height: 10),
                      Row(
                        children: [Text("Pincode")],
                      ),
                      SizedBox(height: 5,),
                      TextField(
                        controller: edit6,
                        decoration: InputDecoration(
                          hintText: "pincode",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 10,),
                      if (control1 || control2 || control3 || control4 || control5 || control6)
                        Text(
                          'Please fill in all fields',
                          style: TextStyle(color: Colors.red),
                        ),
                      Container(
                        child: CheckboxListTile(
                          title:
                          Text("I accept the terms and privacy policy",style: TextStyle(letterSpacing: 0.1),),
                          value: acceptedTerms,
                          onChanged: (newValue) {
                            setState(() {
                              acceptedTerms = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      Text("Notes:Terms and Conditions agreements are also known as Terms. More rarely, it may be called something like an End User Services Agreement (EUSA)."),


                      SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>otp()));
                            setState(() {
                              control1 = edit1.text.isEmpty;
                              control2 = edit2.text.isEmpty;
                              control3 = edit3.text.isEmpty;
                              control4 = edit4.text.isEmpty;
                              control5 = edit5.text.isEmpty;
                              control6 = edit6.text.isEmpty;
                              acceptedTerms;
                            });
                            // Add your registration logic here
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(180, 40),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                            backgroundColor: Colors.purple,
                          ),
                          child: Text("Register", style: TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),

                    ],
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
