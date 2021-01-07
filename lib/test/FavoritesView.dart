import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Favorites.dart';
import '../model.dart';

class FavoritesView extends StatefulWidget {
  @override
  _FavoritesViewState createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  List<Recipe> searchResults;
  List<String> favoriteRecipes;

  void _handleFavoritesListChanged(String recipeID) {
    setState(() {
      if (favoriteRecipes.contains(recipeID)) {
        favoriteRecipes.remove(recipeID);
      } else {
        favoriteRecipes.add(recipeID);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildRecipes(searchResults
      .where((recipe) => favoriteRecipes.contains(recipe.id)).toList()));
  }

  _buildRecipes(List<Recipe> recipesList) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: recipesList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(recipesList[index].title),
              );
            },
          ),
        ),
      ],
    );
  }
}
