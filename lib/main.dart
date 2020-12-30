import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import './homeScreen.dart';
import 'model.dart';


void main() {
  var state = MyState();
  state.randomRecipes();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Favorites(),
    );
  }
}
