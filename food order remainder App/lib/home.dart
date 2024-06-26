import 'package:flutter/material.dart';
import 'database_helper.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<Map<String, dynamic>> todayDish = [];

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  void _loadOrders() async {
    final orders = await DatabaseHelper().getOrders();
    setState(() {
      todayDish = orders;
    });
  }

  void addDish() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller1 = TextEditingController();
        TextEditingController controller2 = TextEditingController();
        TextEditingController controller3 = TextEditingController();
        TextEditingController controller4 = TextEditingController();
        return AlertDialog(
          title: Text('Today Food Order'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller1,
                  decoration: InputDecoration(labelText: 'Dish Name'),
                ),
                TextField(
                  controller: controller2,
                  decoration: InputDecoration(labelText: 'Customer Name'),
                ),
                TextField(
                  controller: controller3,
                  decoration: InputDecoration(labelText: 'Delivery Address'),
                ),
                TextField(
                  controller: controller4,
                  decoration: InputDecoration(labelText: 'Phone No'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () async {
                Map<String, String> order = {
                  'dishName': controller1.text,
                  'customerName': controller2.text,
                  'deliveryAddress': controller3.text,
                  'phoneNo': controller4.text,
                };
                await DatabaseHelper().insertOrder(order);
                _loadOrders();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void editDish(Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller1 = TextEditingController(text: order['dishName']);
        TextEditingController controller2 = TextEditingController(text: order['customerName']);
        TextEditingController controller3 = TextEditingController(text: order['deliveryAddress']);
        TextEditingController controller4 = TextEditingController(text: order['phoneNo']);
        return AlertDialog(
          title: Text('Edit Food Order'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,//for correct size of alert box.
              children: [
                TextField(
                  controller: controller1,
                  decoration: InputDecoration(labelText: 'Dish Name'),
                ),
                TextField(
                  controller: controller2,
                  decoration: InputDecoration(labelText: 'Customer Name'),
                ),
                TextField(
                  controller: controller3,
                  decoration: InputDecoration(labelText: 'Delivery Address'),
                ),
                TextField(
                  controller: controller4,
                  decoration: InputDecoration(labelText: 'Phone No'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                Map<String, String> updatedOrder = {
                  'dishName': controller1.text,
                  'customerName': controller2.text,
                  'deliveryAddress': controller3.text,
                  'phoneNo': controller4.text,
                };
                await DatabaseHelper().updateOrder(order['id'], updatedOrder);
                _loadOrders();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void deleteOrder(int id) async {
    await DatabaseHelper().deleteOrder(id);
    _loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("tODo", style: TextStyle(color: Colors.yellow)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todayDish.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text("Dish Name: ${todayDish[index]['dishName']}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Customer Name: ${todayDish[index]['customerName']}"),
                  Text('Delivery Address: ${todayDish[index]['deliveryAddress']}'),
                  Text('Phone No: ${todayDish[index]['phoneNo']}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      editDish(todayDish[index]);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteOrder(todayDish[index]['id']);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          onPressed: () {
            addDish();
          },
          child: Icon(Icons.add, color: Colors.yellow),
          backgroundColor: Colors.grey,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
