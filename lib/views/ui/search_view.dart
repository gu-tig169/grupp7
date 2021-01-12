import 'package:flutter/material.dart';
import '../utils/my_app_bar.dart';
import 'search_list_view.dart';
import 'package:provider/provider.dart';
import '../../models/model.dart';

class Search extends StatefulWidget {
  final Recipe recipe;
  Search(this.recipe);

  @override
  _SearchState createState() => _SearchState(recipe);
}

class _SearchState extends State<Search> {
  String title;
  var _isPressed = false;
  bool _validate = false;
  TextEditingController inputController = TextEditingController();

  _SearchState(recipe) {
    this.title = recipe.title;
    inputController.addListener(() {
      setState(() {
        title = inputController.text;
        if (inputController.text.isEmpty) {
          _validate = true;
        } else if (inputController.text.isNotEmpty) {
          _validate = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF6C804B)),
        elevation: 0,
        title: Text('Search recipes',
            style: TextStyle(color: Color(0xFF6C804B), fontSize: 20)),
        centerTitle: true,
        actions: [
          _filterButton(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: MyAppBar(),
      ),
      body: Center(
        child: Column(
          children: [
            Container(height: 5),
            _searchInputField(),
            Container(height: 15),
            if (_isPressed) _showFilters(),
            Container(height: 10),
            _searchButton(),
          ],
        ),
      ),
    );
  }

  Widget _searchInputField() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            //skuggan under sökfältet, färgen på skuggen och storleken
            color: Colors.grey,
            offset: Offset.zero,
            blurRadius: 3.0,
          ),
        ],
      ),
      width: 380,
      child: TextField(
        controller: inputController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFE5F7D1),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 12),
            child: Icon(Icons.search),
          ),
          hintText: 'Search recipes...',
          hintStyle: TextStyle(fontStyle: FontStyle.italic),
          errorText: _validate ? 'Enter search request' : null,
          suffixIcon: IconButton(
            onPressed: () => inputController.clear(),
            icon: Icon(Icons.clear),
          ),
        ),
      ),
    );
  }

  Widget _filterButton() {
    return IconButton(
      icon: Icon(Icons.filter_alt_outlined),
      onPressed: () {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
    );
  }

  Widget _showFilters() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 5,
            runSpacing: 3,
            children: [
              Filter(filterName: 'Main course'),
              Filter(filterName: 'Side dish'),
              Filter(filterName: 'Dessert'),
              Filter(filterName: 'Appetizer'),
              Filter(filterName: 'Salad'),
              Filter(filterName: 'Bread'),
              Filter(filterName: 'Breakfast'),
              Filter(filterName: 'Soup'),
              Filter(filterName: 'Sauce'),
              Filter(filterName: 'Fingerfood'),
              Filter(filterName: 'Snack'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _searchButton() {
    return Container(
      width: 380,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        onPressed: () {
          setState(() {
            if (inputController.text.isNotEmpty) {
              Provider.of<MyState>(context, listen: false)
                  .searchRecipes(inputController.text);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchListView()));
            }
          });
        },
        color: Color(0xFF6C804B),
        child: Text('Search', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class Filter extends StatefulWidget {
  final String filterName;

  Filter({Key key, this.filterName}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.filterName),
      selected: _isSelected,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
        print(_isSelected);
      },
      backgroundColor: Color(0xFFE8E0A1),
      selectedColor: Color(0xFFE8E0A1),
    );
  }
}
