import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/model.dart';
import 'package:recipe_app/recipe/recipeScreen.dart';

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
            margin: const EdgeInsets.only(bottom: 15), //avståndet mellan korten
            height: 120, //höjden på kortet
            width: 400, //längden på kortet
            decoration: BoxDecoration(
              color: Colors.grey[100], //färgen på kortet
              borderRadius: BorderRadius.all(
                  Radius.circular(3)), //grad av rundning på hörnen
              boxShadow: [
                BoxShadow(
                  //skuggan under kortet, färgen på skuggen och storleken
                  color: Colors.grey,
                  offset: Offset(.0, 2.0),
                  blurRadius: 3.0,
                ),
              ],
            ),
          ),
          Container(
            //bilden
            width: 120,
            height: 120,
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                image: new DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(widget.recipe.imgURL))),
          ),
          Positioned(
            //positionen på texten
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
            //stjärnorna hårdkodade
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