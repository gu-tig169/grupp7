import 'package:flutter/material.dart';
import '../services/api.dart';

class Recipe {
  final int id;
  final String title, imgURL;

  Recipe({this.id, this.title, this.imgURL});

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
  List<Recipe> _favoriteRecipes = [];
  List<Recipe> get favoriteRecipes => _favoriteRecipes;
  

  Future searchRecipes(String query) async {
    List<Recipe> recipes = await Api.getRecipesBySearch(query);
    _recipes = recipes;
    notifyListeners();
  }

  Future fetchCuisine(String cuisine) async {
    List<Recipe> recipes = await Api.getCuisine(cuisine);
    _recipes = recipes;
    notifyListeners();
  }

  void toggleFavorite(Recipe recipe) {
    final favoriteRecipe = _favoriteRecipes.firstWhere(
        (favoriteRecipe) => favoriteRecipe.id == recipe.id,
        orElse: () => null);
    //Hitta det första receptet i _favoriteRecipes som matchar med id:t på recepten vi hämtar
    if (favoriteRecipe == null) {
      _favoriteRecipes.add(recipe);
      //Om vi trycker på hjärtat och favoriteRecipe inte har ett id som matchar, lägg till favoriteRecipe i _favoriteRecipes
    } else {
      _favoriteRecipes.remove(favoriteRecipe);
      //Om vi trycker på hjärtat och id:t matchar, ta bort favoriteRecipe från _favoriteRecipes
    }
    notifyListeners();
  }

  bool isFavorite(Recipe recipe) {
    return _favoriteRecipes.any((favoriteRecipe) => recipe.id == favoriteRecipe.id);
  } //Värdet på om favoriteRecipe är favoritmarkerat eller ej genom att kolla om id:t stämmer överens
}
