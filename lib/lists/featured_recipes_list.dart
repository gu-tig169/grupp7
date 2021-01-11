import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recipe_app/views/ui/recipe_view.dart';

import '../models/model.dart';
import '../services/api.dart';

FutureBuilder featuredRecipesData() {
  return FutureBuilder<List<Recipe>>(
      future: Api.getFeaturedRecipes(),
      builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
        if (snapshot.hasData) {
          List<Recipe> data = snapshot.data;
          return _featuredRecipesList(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      });
}

ListView _featuredRecipesList(data) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecipeView(recipe: data[index])));
            },
            child: _featuredRecipesItem(data[index].imgURL, data[index].title));
      });
}

Widget _featuredRecipesItem(image, title) {
  return Container(
      margin: EdgeInsets.only(left: 8, right: 8),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        image:
            new DecorationImage(fit: BoxFit.fill, image: NetworkImage(image)),
      ),
      child: Container(
          margin: EdgeInsets.only(top: 150),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: (Radius.circular(24)),
                bottomRight: (Radius.circular(24))),
            color: Color(0x806C804B),
          ),
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 5),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          )));
}
