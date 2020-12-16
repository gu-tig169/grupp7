import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      
      body: 
      _myFavorites(),    
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: Colors.grey[100],
    border: Border.all(
      width: 1, 
      
    ),
  );
}

Widget _myFavorites() {
  var favoriteRecipies = [
    'Kyckling',  
    'Tacopaj', 
    'bröd',
    'kött',  
    'nudlar',
    'gröt',
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
      margin: const EdgeInsets.only(bottom: 20),
      height: 150,
      width: 600,
      decoration: BoxDecoration(
        color: Color(0xFFF5AE58),
        borderRadius: BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(.0, 2.0),
            blurRadius: 6.0,
      ),
        ],
      ),
    ),

  Container( 
    height: 150,
    width: 125,
    decoration: BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.all(Radius.circular(24)),
    ),  
  ),

  Container(
    width: 120,
    height: 150,
    decoration: new BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(24)),
      image: new DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage("https://www.landleyskok.se/wp-content/uploads/2018/08/kycklingcurry-D14I8962.jpg")
      )
    ),
  ),

  Positioned(
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
  ),  

  Positioned(
    top: 60,
    left: 140,
      child: Row(
        children: [
          Text(text, style: TextStyle(color: Colors.white, fontSize: 24.0)),
          
          Text('42 min', style: TextStyle(color: Colors.white, fontSize: 10.0)),
        ],
      ), 
    ),
        ],
  );
}