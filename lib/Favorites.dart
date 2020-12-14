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

Widget _myFavorites() {
  var favoriteRecipies = [
    'Item1',  
    'Item2', 
    'Item3',
    'Item4',
  ];

  return ListView(
    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 64),
    children: favoriteRecipies.map((item) => _item(item)).toList()
  );
}

Widget _item(text) {
  return Stack(
    children: [ Container(
      margin: const EdgeInsets.only(bottom: 20),
    height: 150,
    width: 600,
    decoration: BoxDecoration(
      color: Colors.lightGreen[800],
    borderRadius: BorderRadius.all(Radius.circular(24)),
    ),
    ),

    Container( //Bilden ska vara här sen
    height: 150,
    width: 120,
    decoration: BoxDecoration(
      color: Colors.lightGreen[900],
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
    )),

    // https://www.landleyskok.se/wp-content/uploads/2018/08/kycklingcurry-D14I8962.jpg

    Positioned(
      top: 16,
      left: 140,
      child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
    children: [
      Icon( Icons.star_rate_rounded,
      color: Colors.white),
      Icon( Icons.star_rate_rounded,
      color: Colors.white),
      Icon( Icons.star_rate_rounded,
      color: Colors.white),
      Icon( Icons.star_half_rounded,
      color: Colors.white),
      Icon( Icons.star_outline_rounded,
      color: Colors.white),
      Text(' (144)', style: TextStyle(color: Colors.white, fontSize: 10.0),
      ),
      ], 
    )
    ), 
    Positioned(
      top: 65,
      left: 140,
      child: Row(
      children: [
      Text('Chicken and rice', style: TextStyle(color: Colors.white, fontSize: 20.0)),
      ],
      
    ), 
    
    ),
    ],
    );
    
  
}