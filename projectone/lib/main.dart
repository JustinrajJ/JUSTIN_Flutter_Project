import 'package:flutter/material.dart';
import 'package:projectone/accountprofile.dart';
import 'package:http/http.dart' as http;
import 'package:projectone/newspage.dart';
import 'package:projectone/search.dart';
import 'dart:convert';
import 'package:projectone/splash%20page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class homePage extends StatefulWidget {
   homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Future <Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4d3aeb33c60a4a5cb5d0c3bdde6b9718'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

 String add="JUST News";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("$add"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (BuildContext)=>search()));
          }, icon: Icon(Icons.search)),
        ],
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
            future: fetchData(),
            builder: (context,snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error:${snapshot.error}");
              } else {
                return ListView.builder(
                  itemCount: snapshot.data?["articles"].length,
                  itemBuilder: (context, index) {
                    List<dynamic> articles = snapshot.data?["articles"];
                    String title =
                        articles[index]["title"] ?? "no title available";
                    String author =
                        articles[index]["author"] ?? "no title available";
                    String urlToImage =
                        articles[index]["urlToImage"] ?? "no title available";
                    String content =
                        articles[index]["content"] ?? "no content available";
                    return Container(
                      height: 100,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListTile(
                                title: Text(
                                  author,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                subtitle: Text(
                                  title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                                leading:  Container(
                                  height: 80,
                                  width: 100,
                                  child: Image.network(urlToImage, fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Center(child: Text("Image load error"));
                                    },
                                ),
                                ),
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext) => NewsPage(
                                            title: title,
                                            urlToImage: urlToImage,
                                            author: author,
                                            content:content
                                          )),);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'JUST News',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Latest News'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>homePage()));
                // Add your onTap logic here
              },
            ),
            ExpansionTile(
              title: Text("Category"),
              children: [
                ListTile(
                  title: Text("Comedy"),
                  onTap: (){
                    setState(() {
                      add="comedy";
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  title: Text("Cinema"),
                  onTap: (){
                    setState(() {
                      add="Cinema";
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  title: Text("Science"),
                  onTap: (){
                    setState(() {
                      add="Science";
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  title: Text("Local"),
                  onTap: (){
                    setState(() {
                      add="Local";
                      Navigator.pop(context);
                    });
                  },
                ),
              ],
            ),
            ListTile(
              title: Text('Setting'),
              onTap: () {
                // Add your onTap logic here
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>MysApp()));
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Add your onTap logic here
              },
            ),
          ],
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