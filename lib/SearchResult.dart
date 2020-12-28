import 'package:flutter/material.dart';

import 'Favorites.dart';
import 'Search.dart';
import 'homeScreen.dart';

class SearchResult extends StatelessWidget {
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
      body: _list(),
    );
  }

  Widget _list() {
    var list = [
      'Yellow gryta',
      'Fabulous cake',
      'Pizza magnifique',
      'Pancake',
      'Hummus',
      'Mudcake',
      'Christmas cookies',
    ];

    return ListView(
      children: list.map((item) => _recipeListView(item)).toList(),
    );
  }

  Widget _recipeListView(text) {
    return Padding(
        padding: EdgeInsets.all(12),
        child: FittedBox(
          child: Container(
            width: 380,
            child: Material(
                color: Color(0xff6C804B),
                elevation: 10,
                borderRadius: BorderRadius.circular(24),
                shadowColor: Color(0x802196F3),
                child: Row(
                  children: [
                    Container( //bilden
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image(
                            fit: BoxFit.fill,
                            alignment: Alignment.topLeft,
                            image: NetworkImage(
                                'https://www.landleyskok.se/wp-content/uploads/2018/08/kycklingcurry-D14I8962.jpg')),
                      ),
                    ),
                    Container( //texten
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(text,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            ],
                          ),
                          Row(children: [
                            Icon(Icons.star, size: 15, color: Colors.yellow),
                            Icon(Icons.star, size: 15, color: Colors.yellow),
                            Icon(Icons.star, size: 15, color: Colors.yellow),
                            Icon(Icons.star_half,
                                size: 15, color: Colors.yellow),
                            Icon(Icons.star_outline,
                                size: 15, color: Colors.yellow),
                          ])
                        ],
                      ),
                    ),
                    Column( //hjärtat som nu sitter på fel ställe men får inte till det
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                icon: Icon(Icons.favorite_border_outlined),
                                iconSize: 18,
                                color: Colors.white,
                                onPressed: () {},
                                alignment: Alignment.topRight),
                          ],
                        )
                      ],
                    ),
                  ],
                )),
          ),
        ));
  }
}
