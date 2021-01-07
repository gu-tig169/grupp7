import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Favorites.dart';
import 'model.dart';

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
          builder: (context, state, child) => Favorites(state.favoriteRecipes)),
        //Lägg in Consumer (?) så man ser SearchList elementen
    );
  }
}

