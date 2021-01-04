import 'package:flutter/material.dart';

import './model.dart';
import './recipeScreen.dart';

class FeaturedList extends StatelessWidget {
  final List<Recipe> list;
  FeaturedList(this.list);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: list.map((item) => _featuredRecipeItem(context, item)).toList(),
    );
  }
}

Widget _featuredRecipeItem(context, Recipe item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RecipeView()));
      },
      child: Container(
          margin: EdgeInsets.only(left: 8, right: 8),
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            image: new DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(item.imgURL)),
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
                  child: Text(item.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  )))),
    );
  }