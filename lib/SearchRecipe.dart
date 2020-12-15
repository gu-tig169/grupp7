import 'package:flutter/material.dart';
import 'FilterRecipes.dart';

class SearchRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(height: 40),
            _searchInput(),
            _categoryRow(),
            _filters(),
            Container(height: 10),
            _searchButton(),
            _recipeTitleRow(),
          ],
        ),
      ),
    );
  }
}

Widget _searchInput() {
  return Container(
    width: 380,
    child: TextField(
        decoration: InputDecoration(
      filled: true,
      fillColor: Color(0xFFE5F7D1),
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(30)),
      prefixIcon: Padding(
        padding: const EdgeInsetsDirectional.only(start: 12),
        child: Icon(Icons.search),
      ),
      hintText: 'Search recipes...',
      hintStyle: TextStyle(fontStyle: FontStyle.italic),
    )),
  );
}

Widget _categoryRow() {
  return Row(
    children: [
      Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Text('Categories',
              style: TextStyle(fontWeight: FontWeight.bold))),
    ],
  );
}

Widget _filters() {
  return Container(
    child: Wrap(
      spacing: 5,
      runSpacing: 3,
      children: [
        FilterRecipes(chipName: 'Meat'),
        FilterRecipes(chipName: 'Chicken'),
        FilterRecipes(chipName: 'Vegetarian'),
        FilterRecipes(chipName: 'Pasta'),
        FilterRecipes(chipName: 'Rice'),
        FilterRecipes(chipName: 'Noodles'),
        FilterRecipes(chipName: 'Pizza'),
        FilterRecipes(chipName: 'Fish'),
      ],
    ),
  );
}

Widget _searchButton() {
  return Container(
    width: 350,
    child: RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      onPressed: () {},
      color: Color(0xFF6C804B),
      child: Text('Search', style: TextStyle(color: Colors.white)),
    ),
  );
}

Widget _recipeTitleRow() {
  return Row(
    children: [
      Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Text('357 recipes found',
              style: TextStyle(fontWeight: FontWeight.bold))),
    ],
  );
}


