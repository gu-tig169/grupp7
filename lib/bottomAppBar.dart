import 'package:flutter/material.dart';
import 'favorite/FavoriteView.dart';
import 'home/home_screen.dart';
import 'model.dart';
import 'search/Search.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      IconButton(
          icon: Icon(Icons.home, color: Color(0xff6C804B)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }),
      IconButton(
          icon: Icon(Icons.favorite, color: Color(0xff6C804B)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FavoriteView()));
          }),
      IconButton(
          icon: Icon(Icons.search, color: Color(0xff6C804B)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Search(Recipe(title: ''))));
          }),
    ]);
  }
}
