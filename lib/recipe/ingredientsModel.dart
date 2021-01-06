import 'package:flutter/material.dart';

import 'package:recipe_app/Api.dart';

class Ingredient {
  String name, ingredient;

  Ingredient({this.ingredient, this.name});

  static Map<String, dynamic> toJson(Ingredient ingredient) {
    return {
      'original': ingredient.ingredient,
      'name': ingredient.name,
    };
  }

  static Ingredient fromJson(Map<String, dynamic> json) {
    return Ingredient(ingredient: json['original'], name: json['name']);
  }
}

class YourState extends ChangeNotifier {
  List<Ingredient> _recipes = [];
  List<Ingredient> get recipes => _recipes;

  Future searchIngredients(int id) async {
    List<Ingredient> recipes = await Api.getIngredients(id);
    _recipes = recipes;
    notifyListeners();
  }
}
