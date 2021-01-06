import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './model.dart';
import './recipeScreen.dart';
import 'Api.dart';
    
FutureBuilder recipesData() {
  return FutureBuilder<List<Recipe>>(
    future: Api.getFeaturedRecipes(),
    builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot){
      if (snapshot.hasData) {
        List<Recipe> data = snapshot.data;
        return _rrecipes(data);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    }
  );
}

ListView _rrecipes(data) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: data.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => RecipeView()));
        },
        child: Container(
          margin: EdgeInsets.only(left: 8, right: 8),
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(data[index].imgURL)),
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
                data[index].title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
              )
            )
          )
        ),
      );
    }
  );
}
