import 'package:flutter/material.dart';

import 'Favorites.dart';
import 'Search.dart';
import 'homeScreen.dart';

class RecipeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
                  height: 275.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        image: AssetImage('assets/vegandish.jpg'),
                        fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                    elevation: 0.0,
                    color: Colors.transparent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)),
                    padding: EdgeInsets.only(
                        top: 0.0, bottom: 0.0, right: 0.0, left: 0.0),
                    onPressed: () {},
                    child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Image.asset(
                          'assets/heartbutton.png',
                          height: 50.0,
                          width: 50.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                color: Colors.lightGreen[700],
                style: BorderStyle.solid,
                width: 4.0,
              ))),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Oven Baked Eggplant',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Image.asset(
                'assets/clock.png',
                height: 20.0,
                width: 20.0,
              ),
              SizedBox(width: 8),
              Text(
                '40 minutes',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '2 Chicken Breasts',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 1.0,
                width: 380.0,
                color: Colors.lightGreen[700],
              ),
              SizedBox(height: 20),
              Text(
                '1/2 Tablespoon of Oil',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 1.0,
                width: 380.0,
                color: Colors.lightGreen[700],
              ),
              SizedBox(height: 20),
              Text(
                '3 Cups of Cheese',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 1.0,
                width: 380.0,
                color: Colors.lightGreen[700],
              ),
              SizedBox(height: 20),
              Text(
                '5 Cups of Rice',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 1.0,
                width: 380.0,
                color: Colors.lightGreen[700],
              ),
              SizedBox(height: 20),
              Text(
                '4 Tablespoons of Mayo',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 1.0,
                width: 380.0,
                color: Colors.lightGreen[700],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
