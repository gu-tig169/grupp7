import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/search/SearchListView.dart';

import './bottomAppBar.dart';
import './model.dart';
import './featuredList.dart' as custom;
import './categories.dart';
//import './Api.dart';
//import 'recipeScreen.dart';

class HomeScreen extends StatelessWidget {
  //@override
  //_HomeScreenState createState() => _HomeScreenState();
//}

//class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: MyAppBar(),
        ),
        body: ListView(children: [
          //Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          //children: <Widget>[
          _welcome(),
          Container(
            margin: EdgeInsets.only(left: 20, top: 30, bottom: 15),
            child: Text(
              'Featured recipes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 200, child: custom.recipesData()),
          Container(
            margin: EdgeInsets.only(left: 20, bottom: 10, top: 50),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Categories())
        ]));
  }

  Widget _welcome() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 50),
      height: 120,
      width: 350,
      decoration: BoxDecoration(
          color: Color(0xff6C804B),
          borderRadius: BorderRadius.only(
              topRight: (Radius.circular(20)),
              bottomRight: (Radius.circular(20)))),
      child: Container(
          margin: EdgeInsets.only(left: 20, top: 30),
          child: Text(
            'Welcome to your favorite recipe app!',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          )),
    );
  }
}
