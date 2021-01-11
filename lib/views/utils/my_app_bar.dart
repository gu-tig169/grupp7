import 'package:flutter/material.dart';
import '../ui/favorite_list_view.dart';
import '../ui/home_view.dart';
import '../../models/model.dart';
import '../ui/search_view.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      IconButton(
          icon: Icon(Icons.home, color: Color(0xff6C804B)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeView()));
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
