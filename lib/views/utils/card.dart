import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/model.dart';
import 'package:recipe_app/views/ui/recipe_view.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;

  RecipeCard({Key key, @required this.recipe}) : super(key: key);

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RecipeView(recipe: widget.recipe)));
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            height: 120, 
            width: 400,
            decoration: BoxDecoration(
              color: Colors.grey[100], 
              borderRadius: BorderRadius.all(
                  Radius.circular(3)), 
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(.0, 2.0),
                  blurRadius: 3.0,
                ),
              ],
            ),
          ),
          Container(
            width: 120,
            height: 120,
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                image: new DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(widget.recipe.imgURL))),
          ),
          Positioned(
            top: 30,
            left: 150,
            child: Container(
              alignment: Alignment.topLeft,
              width: 170,
              child: Column(
                children: [
                  Text(widget.recipe.title,
                      style: TextStyle(color: Colors.black, fontSize: 18.0)),
                ],
              ),
            ),
          ),
          Positioned(
            top: 75,
            left: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.star_rate_rounded,
                    color: Color(0xff6C804B), size: 18),
                Icon(Icons.star_rate_rounded,
                    color: Color(0xff6C804B), size: 18),
                Icon(Icons.star_rate_rounded,
                    color: Color(0xff6C804B), size: 18),
                Icon(Icons.star_half_rounded,
                    color: Color(0xff6C804B), size: 18),
                Icon(Icons.star_outline_rounded,
                    color: Color(0xff6C804B), size: 18),
                Text(
                  ' (144)',
                  style: TextStyle(color: Color(0xff6C804B), fontSize: 12.0),
                ),
              ],
            ),
          ),
          Positioned(
            top: 15,
            right: 25,
            child: FavoriteButton(
              iconSize: 40,
              iconColor: Color(0xff6C804B),
              isFavorite: Provider.of<MyState>(context, listen: false)
                  .isFavorite(widget.recipe),
              valueChanged: (_isFavorite) {
                Provider.of<MyState>(context, listen: false)
                    .toggleFavorite(widget.recipe);
                print('Is Favorite : $_isFavorite');
              },
            ),
          )
        ],
      ),
    );
  }
}
