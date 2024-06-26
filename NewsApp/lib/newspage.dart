import 'package:flutter/material.dart';
import 'package:projectone/main.dart';
import 'package:projectone/accountprofile.dart';



class NewsPage extends StatelessWidget {
  const NewsPage({super.key, required this.title, required this.author, required this.urlToImage,required this.content});
  final String title;
  final String author;
  final String urlToImage;
  final String content;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("NEWS"),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                child: urlToImage != null && urlToImage.isNotEmpty
                    ? Image.network(
                  urlToImage,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Text("Image load error"));
                 },
                )
                    : Center(child: Text("No image")),
              ),
              SizedBox(height: 10,),
              Text(title),
              Text(author,style: TextStyle(fontWeight:FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Column(
                  children: [
                    Text(content),
                    Text(content),
                    Text(content),
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
            icon: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext) => homePage()));
                },
                icon: Icon(Icons.home)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext) => MysApp()));
                },
                icon: Icon(Icons.person)),
            label: 'My Account',
          ),
        ],
      ),

    );
  }
}
