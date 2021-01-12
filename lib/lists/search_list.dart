import 'package:flutter/material.dart';
import '../views/utils/card.dart';
import '../models/model.dart';

class SearchList extends StatefulWidget {
  
  final List<Recipe> list;
  SearchList(this.list);

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      children:
          widget.list.map((recipe) => RecipeCard(recipe: recipe, key: ValueKey(recipe.id))).toList(),
    ); //ValueKey för att känna av rätt recept, utan denna så märkte vi att vi ny sökning får recept med samma plats som tidigare favoritmarkerats
  }
}
