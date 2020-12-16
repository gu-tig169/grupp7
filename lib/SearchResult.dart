import 'package:flutter/material.dart';

class SearchedResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                color: Color(0xFFF5AE58),
                elevation: 10,
                borderRadius: BorderRadius.circular(24),
                shadowColor: Color(0x802196F3),
                child: Row(
                  children: [
                    Container(
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
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(text, style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          Row(children: [
                            Icon(Icons.star, size: 15),
                            Icon(Icons.star, size: 15),
                            Icon(Icons.star, size: 15),
                            Icon(Icons.star, size: 15),
                            Icon(Icons.star_half, size: 15),
                          ])
                        ],
                      ),
                    ),
                    Container(child: Column(children: [Row(children: [IconButton(icon: Icon(Icons.favorite_border_outlined), onPressed: () {},
                    alignment: Alignment.topRight),],)],))
                  ],
                )),
          ),
        ));
  }
}
