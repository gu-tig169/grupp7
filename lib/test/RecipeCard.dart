
import 'package:flutter/material.dart';
import 'package:recipe_app/recipe/recipeScreen.dart';



import '../model.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final bool inFavorites;
  final Function onFavoriteButtonPressed;

  RecipeCard(
      {@required this.recipe,
      @required this.inFavorites,
      @required this.onFavoriteButtonPressed});

  @override
  Widget build(BuildContext context) {
  return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RecipeView(recipe: recipe)));
      },
      child: Padding(
          padding: EdgeInsets.all(12),
          child: FittedBox(
            child: Container(
              width: 380,
              child: Material(
                  color: Color(0xff6C804B),
                  elevation: 10,
                  borderRadius: BorderRadius.circular(24),
                  shadowColor: Color(0x802196F3),
                  child: Row(
                    children: [
                      Container(
                        //bilden
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image(
                              fit: BoxFit.cover,
                              alignment: Alignment.topLeft,
                              image: NetworkImage(recipe.imgURL)),
                        ),
                      ),
                      Container(
                        //texten
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(recipe.title,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white)),
                              ],
                            ),
                            Row(children: [
                              Icon(Icons.star, size: 15, color: Colors.yellow),
                              Icon(Icons.star, size: 15, color: Colors.yellow),
                              Icon(Icons.star, size: 15, color: Colors.yellow),
                              Icon(Icons.star_half,
                                  size: 15, color: Colors.yellow),
                              Icon(Icons.star_outline,
                                  size: 15, color: Colors.yellow),
                            ])
                          ],
                        ),
                      ),
                      Column(
                        //hjärtat som nu sitter på fel ställe men får inte till det
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildFavoriteButton(),

                              /*FavoriteButton(
                                iconSize: 40,
                                iconColor: Color(0xFFF5AE58),
                                isFavorite: recipe.isFavorite,
                                valueChanged: (_isFavorite) {
                                 
                                  setState(() {
                                    
                                  });

                                    recipe.isFavorite = _isFavorite;
                                  
                                  
                                  Provider.of<MyState>(context, listen: false)
                                      .setFavoriteValue(recipe);

                                  print('Is Favorite : $_isFavorite');
                                  
                                },
                              ),*/
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          )),
    );
  
}

    Widget _buildFavoriteButton() {
      return RawMaterialButton(
        constraints: const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
        onPressed: () => onFavoriteButtonPressed(recipe.id),
        child: Icon(
          // Conditional expression:
          // show "favorite" icon or "favorite border" icon depending on widget.inFavorites:
          inFavorites == true ? Icons.favorite : Icons.favorite_border,
        ),
        elevation: 2.0,
        fillColor: Colors.white,
        shape: CircleBorder(),
      ); }
}