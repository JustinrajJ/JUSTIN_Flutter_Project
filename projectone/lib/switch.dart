import 'package:flutter/material.dart';
import 'package:projectone/main.dart';
import 'package:projectone/accountprofile.dart';

class SwitchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page(),
    );
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
 // Initial value of the switch button
bool notification=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification setting"),
      ),

      body: SafeArea(
        child: Container(

          child: Column(

            children: <Widget>[
             SwitchListTile(title: Text("Enable Notification"),
                 value: notification, onChanged:(newValue){
                      setState(() {
                        notification= newValue;
                      });
             })
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