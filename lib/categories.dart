import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/search/SearchListView.dart';

import 'model.dart';

class Categories extends StatelessWidget {
  /*@override
  _Categories createState() => _Categories();
}

class _Categories extends State<Categories> {*/
  final List<String> cuisineList = <String>[
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

  final List<String> moreCuisines = <String>[
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
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: cuisineList.length,
              itemBuilder: (BuildContext context, int index) {
                return FlatButton(
                  child: Text(cuisineList[index]),
                  onPressed: () {
                    Provider.of<MyState>(context, listen: false)
                        .fetchCuisine(cuisineList[index]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchListView()));
                  },
                );
              }),
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: moreCuisines.length,
              itemBuilder: (BuildContext context, int index) {
                return FlatButton(
                  child: Text(moreCuisines[index]),
                  onPressed: () {
                    Provider.of<MyState>(context, listen: false)
                        .fetchCuisine(moreCuisines[index]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchListView()));
                  },
                );
              }),
        ),
      ],
    );
  }
}
