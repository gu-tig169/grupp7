import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/my_app_bar.dart';
import '../../models/model.dart';

class RecipeView extends StatefulWidget {
  final Recipe recipe;
  RecipeView({this.recipe});

  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  @override
  initState() {
    super.initState();
    Provider.of<MyState>(context, listen: false)
        .getDetailedInformation(widget.recipe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF6C804B)),
        elevation: 0,
        title: Text(widget.recipe.title,
            style: TextStyle(color: Color(0xFF6C804B), fontSize: 20)),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        child: MyAppBar(),
      ),
      body: ListView(
        children: [
          _image(),
          Container(height: 20),
          _ingredientsTitle(),
          Container(height: 20),
          _ingredientsList(),
          Container(height: 20),
          _instructionsTitle(),
          Container(height: 20),
          _instructionsList(),
        ],
      ),
    );
  }

  Widget _image() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      width: 550,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(10, 10),
          )
        ],
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(widget.recipe.imgURL),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 50,
            width: 550,
            margin: EdgeInsets.only(top: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: (Radius.circular(24)),
                  bottomRight: (Radius.circular(24))),
              color: Color(0x806C804B),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 5),
              child: Text(
                widget.recipe.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 25,
            child: FavoriteButton(
              iconSize: 40,
              iconColor: Color(0xff6C804B),
              isFavorite: Provider.of<MyState>(context, listen: false)
                  .isFavorite(widget.recipe),
              valueChanged: (_isFavorite) {
                Provider.of<MyState>(context, listen: false)
                    .toggleFavorite(widget.recipe);
                print('Is Favorite : $_isFavorite');
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _ingredientsTitle() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 23),
      child: Text('Ingredients',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _ingredientsList() {
    List<Ingredient> ingredients = Provider.of<MyState>(context).ingredients;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
          children: ingredients
              .map((ingredient) => ListTile(title: Text(ingredient.ingredient)))
              .toList()),
    );
    //Ej listen: false då den behöver uppdateras efter att vi kommit in i vyn
  } //Litsen: false = rita ej om?

  Widget _instructionsTitle() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 23),
      child: Text('Instructions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _instructionsList() {
    List<Instruction> instructions = Provider.of<MyState>(context).instructions;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
          children: instructions
              .map((instruction) => ListTile(
                  leading: Text(instruction.number.toString()),
                  title: Text(instruction.step)))
              .toList()),
    );
  }
}
