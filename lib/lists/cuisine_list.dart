import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/views/ui/search_list_view.dart';

import '../models/model.dart';

class CuisineList extends StatelessWidget {
  final List<String> cuisineListOne = <String>[
    'African',
    'American',
    'British',
    'Cajun',
    'Caribbean',
    'Chinese',
    'Eastern European',
    'European',
    'French',
    'German',
    'Greek',
    'Indian',
    'Irish',
  ];

  final List<String> cuisineListTwo = <String>[
    'Italian',
    'Japanese',
    'Jewish',
    'Korean',
    'Latin American',
    'Mediterranean',
    'Mexican',
    'Middle Eastern',
    'Nordic',
    'Southern',
    'Spanish',
    'Thai',
    'Vietnamese'
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _cuisineListOne()),
        Expanded(child: _cuisineListTwo()),
      ],
    );
  }

  Widget _cuisineListOne() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: cuisineListOne.length,
        itemBuilder: (BuildContext context, int index) {
          return FlatButton(
            child: Text(cuisineListOne[index]),
            onPressed: () {
              Provider.of<MyState>(context, listen: false)
                  .fetchCuisine(cuisineListOne[index]);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchListView()));
            },
          );
        });
  }

  Widget _cuisineListTwo() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: cuisineListTwo.length,
        itemBuilder: (BuildContext context, int index) {
          return FlatButton(
            child: Text(cuisineListTwo[index]),
            onPressed: () {
              Provider.of<MyState>(context, listen: false)
                  .fetchCuisine(cuisineListTwo[index]);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchListView()));
            },
          );
        });
  }
}
