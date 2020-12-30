import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Favorites.dart';
import 'Search.dart';
import 'SearchList.dart';
import 'homeScreen.dart';
import 'model.dart';

class SearchListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF6C804B)),
        elevation: 0,
        title: Text('Recipes Found',
            style: TextStyle(color: Color(0xFF6C804B), fontSize: 20)),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Icon(Icons.home, color: Color(0xff6C804B)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }),
            IconButton(
                icon: Icon(Icons.favorite, color: Color(0xff6C804B)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Favorites()));
                }),
            IconButton(
                icon: Icon(Icons.search, color: Color(0xff6C804B)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Search()));
                }),
            IconButton(
                icon: Icon(Icons.view_list, color: Color(0xff6C804B)),
                onPressed: () {})
          ],
        ),
      ),
      body:
      Consumer<MyState> (builder: (context, state, child) => SearchList(state.recipes)),
         // _nonsens(), //Lägg in Consumer (?) så man ser SearchList elementen
    );
  }
}


