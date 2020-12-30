import 'package:flutter/material.dart';
import 'Api.dart';

class Recipe {
  final int id;
  final String title;

  Recipe({this.id, this.title});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      //imgURL: 'https://spoonacular.com/recipeImages/' + json['image'],
    );
  } //fromJson ist fromMap?
}

class MyState extends ChangeNotifier {
  List<Recipe> _recipes = [];
  List <Recipe> get recipes => _recipes;

  Future randomRecipes() async {
    List<Recipe> recipes = await Api.getRandomRecipes();
    _recipes = recipes;
    notifyListeners();
  }
}
