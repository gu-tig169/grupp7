import 'package:flutter/material.dart';

import 'package:favorite_button/favorite_button.dart';
import 'Api.dart';
//import 'Search.dart';
import 'bottomAppBar.dart';
import 'homeScreen.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: MyAppBar(),
      ),
      
      backgroundColor: Colors.white,
      
      body: 
      _myFavorites(),    
    );
  }
}

/*BoxDecoration myBoxDecoration() { //GÖR INGENTING????
  return BoxDecoration(
    color: Colors.blue[100],
    border: Border.all(
      width: 10, 
      
    ),
  );
}*/

Widget _myFavorites() {
  var favoriteRecipies = [
    'Kycklingoch ris ',  
    
  ];

  return ListView(
    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 64), //indragningen av kortet
    children: favoriteRecipies.map((favorite) => _favorite(favorite)).toList()
  );
}

Widget _favorite(text) {
   return Stack(
    children: [ 
      Container(
      margin: const EdgeInsets.only(bottom: 25), //avståndet mellan korten
      height: 120, //höjden på kortet
      width: 400, //längden på kortet
      decoration: BoxDecoration(
        color: Color(0xff6C804B), //färgen på kortet
        borderRadius: BorderRadius.all(Radius.circular(24)), //grad av rundning på hörnen
        boxShadow: [
          BoxShadow( //skuggan under kortet, färgen på skuggen och storleken
            color: Colors.grey,
            offset: Offset(.0, 2.0),
            blurRadius: 6.0,
      ),
        ],
      ),
    ),

  /*Container( //boxen som skapar skuggan till höger av bilden
    height: 120,
    width: 125,
    decoration: BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.all(Radius.circular(24)),
    ),  
  ),*/

  Container( //bilden
    width: 120,
    height: 120,
    decoration: new BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(24)),
      image: new DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage("https://www.landleyskok.se/wp-content/uploads/2018/08/kycklingcurry-D14I8962.jpg")
      )
    ),
  ),

  /*Positioned( //stjärnorna hårdkodade
    top: 16,
    left: 140,
      child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
        children: [
          Icon( Icons.star_rate_rounded, color: Colors.white),
          Icon( Icons.star_rate_rounded, color: Colors.white),
          Icon( Icons.star_rate_rounded, color: Colors.white),
          Icon( Icons.star_half_rounded, color: Colors.white),
          Icon( Icons.star_outline_rounded, color: Colors.white),
      
          Text(' (144)', style: TextStyle(color: Colors.white, fontSize: 10.0),),
        ],
      ),
  ),  */

  Positioned( //positionen på texten
    top: 35,
    left: 150,
      child: Container (
        alignment: Alignment.centerLeft,
      //padding: const EdgeInsets.all(16.0),
      width: 170,
      child: Column (
        children:[
          Text(text, style: TextStyle(color: Colors.white, fontSize: 18.0)),
          
        ],
      ), 
    ),
  ),

 Positioned(
   top: 45,
   right: 20,
   child: FavoriteButton(
                iconSize: 40,
                iconColor: Color(0xFFF5AE58),
                isFavorite: false,
                valueChanged: (_isFavorite) {
                  print('Is Favorite : $_isFavorite');
                },
              ),
 )
 


  ],
  );
}