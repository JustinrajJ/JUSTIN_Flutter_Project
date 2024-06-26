import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Make sure this line is included
import 'package:blogapp/firebase_options.dart';


class home extends StatefulWidget {

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Page 1'),
    Text('Page 2'),
    Text('Page 3'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final CollectionReference a = FirebaseFirestore.instance.collection("user");
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  Future<void> addUser() async {
    try {
      String name = nameController.text;
      int age = int.tryParse(ageController.text) ?? 0;
      if (name.isNotEmpty && age>0) {
        await a.add({
          'Full_Name': name,
          'Student age': age,
        });
        print("user added to firestore");
      } else {
        print("please enter valid name and age");
      }
    } catch (e) {
      print("Error adding user to Firebase:$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FIRESTORE"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [
          Icon(Icons.search),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: ageController,
            decoration: InputDecoration(
              hintText: "Age",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: addUser, child: Text("Add User To Firestore"))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
