import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model.dart';
import '../recipe/recipeScreen.dart';

class SearchList extends StatelessWidget {
  final List<Recipe> list;
  SearchList(this.list);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list.map((recipe) => _recipeListItem(context, recipe)).toList(),
    );
  }

  Widget _recipeListItem(context, Recipe recipe) {
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
                              FavoriteButton(
                                iconSize: 40,
                                iconColor: Color(0xFFF5AE58),
                                isFavorite: recipe.isFavorite,
                                valueChanged: (_isFavorite) {
                                  Provider.of<MyState>(context, listen: false)
                                        .getFavoriteValue(recipe);
                                  print('Is Favorite : $_isFavorite');
                                },
                              ),
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
}
