import 'package:flutter/material.dart';

//Innehåller två klasser atm, Search och Filter. Dela på dem till separata filer?

class Search extends StatelessWidget {
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
            //_recipeTitleRow(),
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
        Filter(chipName: 'Meat'),
        Filter(chipName: 'Chicken'),
        Filter(chipName: 'Vegetarian'),
        Filter(chipName: 'Pasta'),
        Filter(chipName: 'Rice'),
        Filter(chipName: 'Noodles'),
        Filter(chipName: 'Pizza'),
        Filter(chipName: 'Fish'),
      ],
    ),
  );
}

Widget _searchButton() {
  return Container(
    width: 350,
    child: RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      onPressed: () {
        //Lägg in så när man klickar på denna kommer man till den sökta receptvyn
      },
      color: Color(0xFF6C804B),
      child: Text('Search', style: TextStyle(color: Colors.white)),
    ),
  );
} 

/*Widget _recipeTitleRow() {
  return Row(
    children: [
      Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Text('357 recipes found',
              style: TextStyle(fontWeight: FontWeight.bold))),
    ],
  );
}*/

class Filter extends StatefulWidget {
  final String chipName;

  Filter({Key key, this.chipName}) : super(key: key);

  @override 
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
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
} //Jag antar att dessa två klasser kommer att slås ihop eller om jag gör två filer men låter dem ligga i samma så länge


