import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app/recipe/ingredientsModel.dart';
import 'package:recipe_app/recipe/instructionsModel.dart';
import 'package:recipe_app/recipe/recipeModel.dart';
import 'model.dart';

const API_URL = 'https://api.spoonacular.com/recipes/complexSearch';
const API_KEY = '84469f9abfd3421faed7b60636448162';

/*API NYCKLAR:
Julia: 84469f9abfd3421faed7b60636448162
Vendela: 24ed4573b07f4bfca8d8abade67de174
Maja: eb9d1e824ad44421b3404337c77c485c */

class Api {
  static Future<List<Recipe>> getRecipesFromSearch(String query) async {
    var response = await http.get('$API_URL?query=$query&apiKey=$API_KEY');
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json);
      return json['results'].map<Recipe>((data) {
        return Recipe.fromJson(data);
      }).toList();
    } else {
      throw Exception(response.statusCode.toString());
    } //ta hand
  }

  static Future<List<Recipe>> getFeaturedRecipes() async {
    http.Response response =
        await http.get('$API_URL?number=5&sort=random&apiKey=$API_KEY');
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json);
      return json['results'].map<Recipe>((data) {
        return Recipe.fromJson(data);
      }).toList();
    } else {
      throw Exception(response.statusCode.toString());
    }
  }

  static Future<List<Ingredient>> getIngredients(int id) async {
    var url =
        'https://api.spoonacular.com/recipes/$id/information?apiKey=$API_KEY';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json);
      return json['results'].map<Ingredient>((data) {
        return Ingredient.fromJson(data);
      }).toList();
    } else {
      throw Exception(response.statusCode.toString());
    } //ta hand
  }

  static Future<List<Instruction>> getInstructions(int id) async {
    var url =
        'https://api.spoonacular.com/recipes/$id/analyzedInstructions?apiKey=$API_KEY';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json);
      return json['results'].map<Instruction>((data) {
        return Instruction.fromJson(data);
      }).toList();
    } else {
      throw Exception(response.statusCode.toString());
    } //ta hand
  }

  static Future getRecipeInformation(Recipe recipe) async {
    var ingredient = await getIngredients(recipe.id);
    var instructions = await getInstructions(recipe.id);
    return RecipeInformation(
        ingredient: ingredient, instructions: instructions, recipe: recipe);
  }
}
