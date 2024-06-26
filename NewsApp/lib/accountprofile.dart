import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:projectone/main.dart';
import 'package:projectone/switch.dart';

void main() {
  runApp(MysApp());
}

class MysApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green, // Set the app's primary theme color
      ),
      debugShowCheckedModeBanner: false,
      home: PasswordValidator(),
    );
  }
}

class PasswordValidator extends StatefulWidget {

  @override
  _PasswordValidatorState createState() => _PasswordValidatorState();
}

class _PasswordValidatorState extends State<PasswordValidator> {
  XFile? image;

  final ImagePicker picker = ImagePicker();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    child: ClipOval(
                      child:  image == null ?  Image.asset("images/profile.jpg") : Image.file(File(image!.path),fit: BoxFit.cover,width: 400,height: 500,),
                    ),

                  ),

                  // Positioned(
                  //   bottom:0,
                  //   right: 0,
                  //   child: Container(
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         color: Colors.black,
                  //
                  //
                  //       ),
                  //       padding: EdgeInsets.all(0),
                  //       child:IconButton(
                  //         onPressed: (){
                  //         showModalBottomSheet(
                  //             context: context,
                  //             builder: (BuildContext context) {
                  //               return Container(
                  //                 width: 400,
                  //                 height: 200,
                  //                 child: Row(
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   crossAxisAlignment: CrossAxisAlignment.center,
                  //                   children: [
                  //                     IconButton(
                  //                         onPressed: () async {
                  //                           final img = await picker.pickImage(
                  //                               source: ImageSource.camera);
                  //                           setState(() {
                  //                             image = img;
                  //                           });
                  //                         },
                  //                         icon: Icon(Icons.camera)),
                  //                     SizedBox(
                  //                       width: 50,
                  //                     ),
                  //                     IconButton(
                  //                         onPressed: () async {
                  //                           final img = await picker.pickImage(
                  //                               source: ImageSource.gallery);
                  //                           setState(() {
                  //                             image = img;
                  //                           });
                  //                         },
                  //                         icon: Icon(Icons.browse_gallery_rounded)),
                  //                     SizedBox(
                  //                       width: 50,
                  //                     ),
                  //
                  //
                  //                     IconButton(
                  //                         onPressed: () {
                  //                           setState(() {
                  //                             image = null;
                  //                           });
                  //
                  //                         }, icon: Icon(Icons.remove)),
                  //                   ],
                  //                 ),
                  //               );
                  //             });
                  //       }, icon: Icon(Icons.add),color: Colors.white,),
                  //   ),
                  // ),

                ],
              ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'User Information',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text('Name: John Doe'),
              Text('Email: john.doe@example.com'),
              // Add more user information widgets as needed
              SizedBox(height: 20.0),
              Text(
                'Account Management',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit Profile'),
                onTap: () {
                  // Navigate to the edit profile page
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          width: 400,
                          height: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    final img = await picker.pickImage(
                                        source: ImageSource.camera);
                                    setState(() {
                                      image = img;
                                    });
                                  },
                                  icon: Icon(Icons.camera)),
                              SizedBox(
                                width: 50,
                              ),
                              IconButton(
                                  onPressed: () async {
                                    final img = await picker.pickImage(
                                        source: ImageSource.gallery);
                                    setState(() {
                                      image = img;
                                    });
                                  },
                                  icon: Icon(Icons.browse_gallery_rounded)),
                              SizedBox(
                                width: 50,
                              ),


                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      image = null;
                                    });

                                  }, icon: Icon(Icons.remove)),
                            ],
                          ),
                        );
                      });
                },
              ),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text('Change Password'),
                onTap: () {
                  // Navigate to the change password page
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordPage()));
                },
              ),
              // Add more account management options as needed
              SizedBox(height: 20.0),
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notification Settings'),
                onTap: () {
                  // Navigate to the notification settings page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SwitchPage()));

                },
              ),
              // Add more settings options as needed
            ],
          ),
        ),


            ],
          ),


        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>homePage()));
            }, icon:Icon(Icons.home)),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>MysApp()));
            }, icon:Icon(Icons.person)),
            label: 'My Account',
          ),
        ],



      ),
    );
  }

}


