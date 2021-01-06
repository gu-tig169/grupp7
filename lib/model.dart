import 'package:flutter/material.dart';
import 'Api.dart';

class Recipe {
  final int id;
  final String title, imgURL;
  bool isFavorite;

  Recipe({this.id, this.title, this.imgURL, this.isFavorite = false});

  void favoriteValue() {
    isFavorite = !isFavorite;
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      imgURL: json['image'],
    );
  } //fromJson ist fromMap?
}

class MyState extends ChangeNotifier {
  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;
  /*List<Recipe> get favoriteList {
    return favoriteList.where((Recipe recipe) => recipe.isFavorite).toList();
  }*/

  Future searchRecipes(String query) async {
    List<Recipe> recipes = await Api.getRecipesFromSearch(query);
    _recipes = recipes;
    notifyListeners();
  }

  Future fetchRecipes() async {
    List<Recipe> recipes = await Api.getFeaturedRecipes();
    _recipes = recipes;
    notifyListeners();
  }

  Future fetchCuisine(String cuisine) async {
    List<Recipe> recipes = await Api.getCuisine(cuisine);
    _recipes = recipes;
    notifyListeners();
  }

  List<Recipe> favorite(bool isFavorite) {
    if (isFavorite == true) {
      return _recipes.where((recipe) => recipe.isFavorite).toList();
    }
    return null;
  }

  void getFavoriteValue(Recipe recipe) {
    final recipeIndex = _recipes.indexOf(recipe);
    _recipes[recipeIndex].favoriteValue();
    notifyListeners();
  }
}
