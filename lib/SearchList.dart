import 'package:flutter/material.dart';

import 'model.dart';

class SearchList extends StatelessWidget {

  final List<Recipe> list;
  SearchList(this.list);
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list.map((item) => _recipeListItem(item)).toList(),
    );
  }

  Widget _recipeListItem(text) {
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
                    Container(
                      //bilden
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
                      //texten
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
                    Column(
                      //hjärtat som nu sitter på fel ställe men får inte till det
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
