import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/lists/favorite_list.dart';

import '../../models/model.dart';

class FavoriteView extends StatelessWidget {
  final bool isFavorite;
  FavoriteView({this.isFavorite});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF6C804B)),
        elevation: 0,
        title: Text('Favorites',
            style: TextStyle(color: Color(0xFF6C804B), fontSize: 20)),
        centerTitle: true,
      ),
      body: Consumer<MyState>(
          builder: (context, state, child) => FavoriteList(state.favoriteRecipes)),
    );
  }
}

//Valde att göra en separat fil för att kunna lägga till titel längst upp. 
//Hade kunnat göra Provider.of<MyState> av favoriteRecipes direkt i bottomAppBar men ville ha lite specifik design
//Samma med SearchList

