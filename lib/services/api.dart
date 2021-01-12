import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app/models/model.dart';
import 'api_exceptions.dart';

const API_URL = 'https://api.spoonacular.com/recipes';
const API_KEY = 'f7c8246af3864e1eb09248569b8e2d7f';

/*API NYCKLAR:
Julia: 84469f9abfd3421faed7b60636448162
Vendela: 24ed4573b07f4bfca8d8abade67de174
Maja: eb9d1e824ad44421b3404337c77c485c */

class Api {
  static Future<List<Recipe>> getRecipesBySearch(String query) async {
    var response = await http.get('$API_URL/complexSearch?query=$query&apiKey=$API_KEY');
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json);
      return json['results'].map<Recipe>((data) {
        return Recipe.fromJson(data);
      }).toList();
    } else {
      throw FetchDataException(' No connection with Server. Statuscode: ${response.statusCode.toString()}.');
    }
  }

  static Future<List<Recipe>> getFeaturedRecipes() async {
    var response =
        await http.get('$API_URL/complexSearch?number=5&sort=random&apiKey=$API_KEY');
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json);
      return json['results'].map<Recipe>((data) {
        return Recipe.fromJson(data);
      }).toList();
    } else {
      throw FetchDataException(' No connection with Server. Statuscode: ${response.statusCode.toString()}.');
    }
  }

  static Future<List<Recipe>> getCuisine(String cuisine) async {
    var response = await http.get('$API_URL/complexSearch?cuisine=$cuisine&apiKey=$API_KEY');
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json);
      return json['results'].map<Recipe>((data) {
        return Recipe.fromJson(data);
      }).toList();
    } else {
      throw FetchDataException(' No connection with Server. Statuscode: ${response.statusCode.toString()}.');
    }
  }

  static Future<List<Ingredient>> getIngredients(int id) async {
    var response = await http.get('$API_URL/$id/information/?apiKey=$API_KEY');
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json);
      return json['extendedIngredients'].map<Ingredient>((data) {
        return Ingredient.fromJson(data);
      }).toList();
    } else {
      throw FetchDataException(' No connection with Server. Statuscode: ${response.statusCode.toString()}.');
    }
  }

  static Future<List<Instruction>> getInstructions(int id) async {
    var response = await http.get('$API_URL/$id/analyzedInstructions?apiKey=$API_KEY');
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json);
      return json[0]['steps'].map<Instruction>((data) {
        return Instruction.fromJson(data);
      }).toList();
    } else {
      throw FetchDataException(' No connection with Server. Statuscode: ${response.statusCode.toString()}.');
    }
  }
}
