import 'package:flutter/material.dart';
import 'package:recipe_app/Api.dart';
import 'package:recipe_app/search/Search.dart';

import '../bottomAppBar.dart';
import '../home/home_screen.dart';
import '../model.dart';

class RecipeView extends StatefulWidget {
  final Recipe recipe;
  RecipeView({this.recipe});

  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  var recipeInfo;

  void _getRecipeInformation(Recipe recipe) async {
    var information = await Api.getRecipeInformation(recipe);
    setState(() {
      recipeInfo = information;
    });
  }

  initState() {
    super.initState();
    _getRecipeInformation(widget.recipe);
  }

  @override
  Widget build(BuildContext context) {
    GestureDetector(
      onTap: () {
        Navigator.pop(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
    );
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: MyAppBar(),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Search(Recipe(title: ''))));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          _recipeImage(),
          // _recipeTitle(),
          Container(
            height: 30,
          ),
          _ingredientsLabel(),
          Container(
            height: 10,
          ),
          _ingredientList(),
          Container(
            height: 30,
          ),
          _instructionsLabel(),
          Container(
            height: 10,
          ),
          _instructionList(),
        ]),
      ),
    );
  }

  Widget _recipeImage() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox(height: 40),
        Stack(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
                    height: 275.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          image: NetworkImage((recipeInfo.recipe.imgURL)),
                          fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    alignment: Alignment.bottomLeft,
                    child: Container(
                        height: 50,
                        width: 500,
                        color: Colors.grey.withOpacity(0.5),
                        child: Center(
                            child: Padding(
                                padding: EdgeInsets.only(right: 170.0),
                                child: Text(recipeInfo.recipe.title,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ))))))),
          ],
        ),
      ],
    );
  }

  Widget _ingredientList() {
    var ingredients = recipeInfo.ingredient;
    return Padding(
        padding: EdgeInsets.all(15),
        child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.lightGreen[700],
                  style: BorderStyle.solid,
                  width: 2.0,
                ),
              ),
            ),
            child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(
                    ingredients[index].ingredient,
                  ));
                })));
  }

  Widget _instructionList() {
    var instructions = recipeInfo.instructions;
    return Padding(
        padding: EdgeInsets.all(15),
        child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.lightGreen[700],
                  style: BorderStyle.solid,
                  width: 2.0,
                ),
              ),
            ),
            child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: instructions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(
                    instructions[index].step,
                    style: TextStyle(fontSize: 16),
                  ));
                })));
  }

  Widget _ingredientsLabel() {
    return Padding(
        padding: EdgeInsets.only(left: 30),
        child: Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Ingredients',
            style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: (FontWeight.bold)),
          ),
        ));
  }
}

Widget _instructionsLabel() {
  return Padding(
      padding: EdgeInsets.only(left: 30),
      child: Container(
        alignment: Alignment.bottomLeft,
        child: Text(
          'Instructions',
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: (FontWeight.bold)),
        ),
      ));
}
