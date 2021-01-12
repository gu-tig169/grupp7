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
          image: new DecorationImage(
              fit: BoxFit.fill, image: NetworkImage(widget.recipe.imgURL)),
        ),
        child: Container(
            margin: EdgeInsets.only(top: 190),
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
            )));
  }

  Widget _ingredientsTitle() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 20),
      child: Text('Ingredients',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _ingredientsList() {
    List<Ingredient> ingredients = Provider.of<MyState>(context).ingredients;
    return Column(
        children: ingredients
            .map((ingredient) => ListTile(title: Text(ingredient.ingredient)))
            .toList());
    //Ej listen: false då den behöver uppdateras efter att vi kommit in i vyn
  } //Litsen: false = rita ej om? Kanske vettigt att använda Consumer då?

  Widget _instructionsTitle() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 20),
      child: Text('Instructions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _instructionsList() {
    List<Instruction> instructions = Provider.of<MyState>(context).instructions;
    return Column(
        children: instructions
            .map((instruction) => ListTile(
                leading: Text(instruction.number.toString()),
                title: Text(instruction.step)))
            .toList());
  }
}
