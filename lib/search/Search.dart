import 'package:flutter/material.dart';
import '../bottomAppBar.dart';
import 'SearchListView.dart';
import 'package:provider/provider.dart';
import '../model.dart';

//Innehåller två klasser atm, Search och Filter. Dela på dem till separata filer?

class Search extends StatefulWidget {
  final Recipe item;
  Search(this.item);

  @override
  _SearchState createState() => _SearchState(item);
}

class _SearchState extends State<Search> {
  String title;
  var _isPressed = false;
  bool _validate = false;
  TextEditingController inputController = TextEditingController();

  _SearchState(item) {
    this.title = item.title;
    inputController.addListener(() {
      setState(() {
        title = inputController.text;
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
      ),
      bottomNavigationBar: BottomAppBar(
        child: MyAppBar(),
      ),
      body: Center(
        child: Column(
          children: [
            _searchInput(),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                Text('Filter'),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down_sharp),
                  onPressed: () {
                    setState(() {
                      _isPressed = !_isPressed;
                    });
                  },
                ), //Kan man flytta ut denna på något smidigt sätt? Den måste ju ligga
              ],
            ),
            if (_isPressed) _filters(),
            Container(height: 10),
            _searchButton(context),
          ],
        ),
      ),
    );
  }

  Widget _searchInput() {
    return Container(
      width: 380,
      child: TextField(
        controller: inputController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFE5F7D1),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 12),
            child: Icon(Icons.search),
          ),
          hintText: 'Search recipes...',
          hintStyle: TextStyle(fontStyle: FontStyle.italic),
          errorText: _validate ? 'Enter search request' : null,
        ),
      ),
    );
  }

  Widget _filters() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 5,
            runSpacing: 3,
            children: [
              Filter(chipName: 'Main course', type: 'main course'),
              Filter(chipName: 'Side dish', type: 'side dish'),
              Filter(chipName: 'Dessert', type: 'dessert'),
              Filter(chipName: 'Appetizer', type: 'appetizer'),
              Filter(chipName: 'Salad', type: 'salad'),
              Filter(chipName: 'Bread', type: 'bread'),
              Filter(chipName: 'Breakfast', type: 'breakfast'),
              Filter(chipName: 'Soup', type: 'soup'),
              Filter(chipName: 'Sauce', type: 'sauce'),
              Filter(chipName: 'Fingerfood', type: 'fingerfood'),
              Filter(chipName: 'Snack', type: 'snack'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _searchButton(context) {
    return Container(
      width: 380,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        onPressed: () {
          setState(() {
            if (inputController.text.isEmpty) {
              _validate = true;
            } else if (inputController.text.isNotEmpty) {
              Provider.of<MyState>(context, listen: false)
                  .searchRecipes(inputController.text);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchListView()));
            }
          });
          //Fixa så errortexten försvinner om man börjar skriva!
        },
        color: Color(0xFF6C804B),
        child: Text('Search', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class Filter extends StatefulWidget {
  final String chipName;
  final String type;

  Filter({Key key, this.chipName, this.type}) : super(key: key);

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
        print(_isSelected);
      },
      backgroundColor: Color(0xFFE8E0A1),
      selectedColor: Color(0xFFE8E0A1),
    );
  }
} //Jag antar att dessa två klasser kommer att slås ihop eller om jag gör två filer men låter dem ligga i samma så länge
