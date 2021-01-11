import 'package:flutter/material.dart';
import 'package:recipe_app/models/model.dart';
import 'package:recipe_app/views/utils/card.dart';
import 'package:recipe_app/views/utils/my_app_bar.dart';


class FavoriteList extends StatelessWidget {
  
  final List<Recipe> favoriteList;
  FavoriteList(this.favoriteList);

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
              favoriteList.map((favoriteRecipe) => RecipeCard(recipe: favoriteRecipe, key: ValueKey(favoriteRecipe.id))).toList()),
    );
  }
}