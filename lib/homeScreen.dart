import 'package:flutter/material.dart';
import 'bottomAppBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //bottomNavigationBar: BottomAppBar(child: MyAppBar()),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          _welcome(),
          Container(
            margin: EdgeInsets.only(left: 20, top: 30, bottom: 15),
            child: Text(
              'Featured recipes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            child: _featuredRecipes(),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, bottom: 10, top: 50),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 135,
            child: _categories(),
          ),
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

  Widget _featuredRecipes() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        _recipe(),
        _recipe(),
        _recipe(),
      ],
    );
  }

  Widget _recipe() {
    return Container(
        margin: EdgeInsets.only(left: 8, right: 8),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          image: new DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "https://www.eatwell101.com/wp-content/uploads/2018/03/Garlic-Butter-flank-Steak-and-Potatoes-Skillet.jpg")),
        ),
        child: Container(
            margin: EdgeInsets.only(top: 150),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: (Radius.circular(24)),
                  bottomRight: (Radius.circular(24))),
              color: Color(0x806C804B),
            ),
            child: Container(
                margin: EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  'Garlic Butter Steak and Potatoes Skillet',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ))));
  }

  Widget _category() {
    return Container(
        margin: EdgeInsets.only(left: 8, right: 8),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          image: new DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "https://www.theflavorbender.com/wp-content/uploads/2019/01/Easy-Chicken-Ramen-FB.jpg")),
        ),
        child: Container(
            margin: EdgeInsets.only(top: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: (Radius.circular(24)),
                  bottomRight: (Radius.circular(24))),
              color: Color(0x806C804B),
            ),
            child: Container(
                margin: EdgeInsets.only(left: 20, top: 6),
                child: Text(
                  'Asian food',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ))));
  }

  Widget _categories() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        _category(),
        _category(),
        _category(),
      ],
    );
  }
}
