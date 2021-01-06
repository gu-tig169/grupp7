import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Favorites.dart';
import 'bottomAppBar.dart';
import 'model.dart';

class FavoriteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF6C804B)),
        elevation: 0,
        title: Text('Recipes Found',
            style: TextStyle(color: Color(0xFF6C804B), fontSize: 20)),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        child: MyAppBar(),
      ),
      body: //Consumer<MyState>(
          //builder: (context, state, child) => Favorites(state.favorite())),
       _nonsens(), //Lägg in Consumer (?) så man ser SearchList elementen
    );
  }
}

Widget _nonsens() {
  return null;
}