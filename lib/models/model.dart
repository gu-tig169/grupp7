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
  }
}

class Instruction {
  String step;
  int number;

  Instruction({this.step, this.number});

  static Instruction fromJson(Map<String, dynamic> json) {
    return Instruction(step: json['step'], number: json['number']);
  }
}

class Ingredient {
  String ingredient;
  int id;

  Ingredient({Key key, this.ingredient, this.id});

  static Ingredient fromJson(Map<String, dynamic> json) {
    return Ingredient(
      ingredient: json['original'],
      id: json['id']);
  }
}

class MyState extends ChangeNotifier {
  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;
  List<Recipe> _favoriteRecipes = [];
  List<Recipe> get favoriteRecipes => _favoriteRecipes;
  List<Ingredient> _ingredients = [];
  List<Ingredient> get ingredients => _ingredients;
  List<Instruction> _instructions = [];
  List<Instruction> get instructions => _instructions;

  Future getDetailedInformation(Recipe recipe) async {
    _ingredients = [];
    _instructions = [];
    notifyListeners();
    List<Ingredient> ingredients = await Api.getIngredients(recipe.id);
    _ingredients = ingredients;
    List<Instruction> instructions = await Api.getInstructions(recipe.id);
    _instructions = instructions;
    notifyListeners();
  }
  

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
    if (favoriteRecipe == null) {
      _favoriteRecipes.add(recipe);
      
    } else {
      _favoriteRecipes.remove(favoriteRecipe);
    }
    notifyListeners();
  }
  bool isFavorite(Recipe recipe) {
    return _favoriteRecipes.any((favoriteRecipe) => recipe.id == favoriteRecipe.id);
  }
}
