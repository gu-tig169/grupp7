import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

const API_URL = 'https://api.spoonacular.com/recipes/complexSearch';
const API_KEY = '';

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
    var response = await http.get('$API_URL?number=5&sort=random&apiKey=$API_KEY');
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

  static Future<List<Recipe>> getCuisine(String cuisine) async {
    var response = await http.get('$API_URL?cuisine=$cuisine&apiKey=$API_KEY');
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
}
  
