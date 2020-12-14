import 'package:flutter/material.dart';

class FilterRecipes extends StatefulWidget {
  final String chipName;

  FilterRecipes({Key key, this.chipName}) : super(key: key);

  @override 
  _FilterRecipesState createState() => _FilterRecipesState();
}

class _FilterRecipesState extends State<FilterRecipes> {
  var _isSelected = false;

  @override 
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      selected: _isSelected,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      backgroundColor: Color(0xFFE8E0A1),
      selectedColor: Color(0xFFE8E0A1),
      );
  }
}