import 'package:flutter/material.dart';

import 'package:favorite_button/favorite_button.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/card.dart';
import '../bottomAppBar.dart';
import '../model.dart';

class Favorites extends StatelessWidget {
  
  final List<Recipe> favoriteList;
  Favorites(this.favoriteList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: MyAppBar(),
      ),
      backgroundColor: Colors.white,
      body: 
      ListView(
          padding: EdgeInsets.symmetric(
              horizontal: 15, vertical: 0), //indragningen av kortet
          children:
              favoriteList.map((recipe) => RecipeCard(recipe: recipe)).toList()),
    );
  }
}