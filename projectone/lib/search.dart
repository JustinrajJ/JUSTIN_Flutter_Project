import 'package:flutter/material.dart';
import 'package:projectone/main.dart';
import 'package:projectone/accountprofile.dart';


class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  String _searchQuery = '';
  List<String> _searchResults = [];

  void _search() {
    // Perform search logic here (e.g., query database, API call)
    setState(() {
      _searchResults = _searchQuery.isEmpty
          ? [] // Clear search results if search query is empty
          : ['Result 1', 'Result 2', 'Result 3']; // Sample search results
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
          onSubmitted: (value) {
            _search();
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: _search,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_searchResults[index]),
            // You can add onTap behavior for each search result item
          );
        },
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
