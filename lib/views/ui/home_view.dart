import 'package:flutter/material.dart';

import '../utils/my_app_bar.dart';
import '../../lists/featured_recipes_list.dart' as featured_list;
import '../../lists/cuisine_list.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: MyAppBar(),
        ),
        body: ListView(children: [
          _welcomeMessage(),
          _featuredRecipes(),
          _textCategories(),
          CuisineList()
        ]));
  }
}

Widget _welcomeMessage() {
  return Container(
    margin: const EdgeInsets.only(bottom: 20, top: 50),
    height: 120,
    decoration: BoxDecoration(
      color: Color(0xff6C804B),
    ),
    child: Container(
        margin: EdgeInsets.only(left: 20, top: 30),
        child: Text('Welcome to your favorite recipe app!',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold))),
  );
}

Widget _featuredRecipes() {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 20, top: 30, bottom: 15),
        child: Text(
          'Featured recipes',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(height: 200, child: featured_list.featuredRecipesData()),
    ],
  );
}

Widget _textCategories() {
  return Container(
    margin: EdgeInsets.only(left: 20, bottom: 10, top: 50),
    child: Text(
      'Categories',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}
