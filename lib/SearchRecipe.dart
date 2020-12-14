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
