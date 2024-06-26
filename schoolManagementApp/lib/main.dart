import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolmanagement/loginPage.dart';


void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:PopUpPage(),
  ));
}
class PopUpPage extends StatefulWidget {
  const PopUpPage({super.key});

  @override
  State<PopUpPage> createState() => _PopUpPageState();
}

class _PopUpPageState extends State<PopUpPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                width: 300,
                child: Card(
                  // decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/logo.png"))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Image(image: AssetImage("images/logo.png")),
                      ),
                      SizedBox(height: 130,),
                      Text('''"Don't miss out!Register now to''',style: TextStyle(fontSize: 18),),
                      Text('''enhance your user experience."''',style: TextStyle(fontSize: 18)),


                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext)=>Second()));
                      }, child: Text("Login In",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(minimumSize:Size(180, 40),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),backgroundColor:Colors.purple),),
                    ),
                    SizedBox(width: 10,),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Later",style: TextStyle(color: Colors.white)),style: ElevatedButton.styleFrom(minimumSize:Size(180, 40),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),backgroundColor:Colors.purple)),
                    ),
                  ],
                ),
              )
            ],

          ),


    );
  }
}

