import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              icon: Icon(Icons.home, color: Color(0xff6C804B)),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.favorite, color: Color(0xff6C804B)),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.search, color: Color(0xff6C804B)),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.view_list, color: Color(0xff6C804B)),
              onPressed: () {})
        ],
      ),
    ));
  }
}
