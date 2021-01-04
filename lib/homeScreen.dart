import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './bottomAppBar.dart';
import './model.dart';
import './featuredList.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: MyAppBar(),
        ),
        body:
         Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _welcome(),
              Row(
                //Container
               // margin: EdgeInsets.only(left: 20, top: 30, bottom: 15),
                children: [Text(
                  'Featured recipes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ), _refresh(context)]
              ),
             // _refresh(context),
              SizedBox(
                height: 200,
                child: 
                Consumer<MyState> (builder: (context, state, child) => FeaturedList(state.recipes)),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, bottom: 10, top: 50),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 135,
                child: _categories(),
              ),
            ])
            
    );
  }

  Widget _refresh(context) {
    return IconButton(icon: Icon(Icons.refresh), onPressed: () { Provider.of<MyState>(context, listen: false).fetchRecipes();
    Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));} );
  }

  Widget _welcome() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 50),
      height: 120,
      width: 350,
      decoration: BoxDecoration(
          color: Color(0xff6C804B),
          borderRadius: BorderRadius.only(
              topRight: (Radius.circular(20)),
              bottomRight: (Radius.circular(20)))),
      child: Container(
          margin: EdgeInsets.only(left: 20, top: 30),
          child: Text(
            'Welcome to your favorite recipe app!',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          )),
    );
  }



  Widget _categories() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        _category(),
        _category(),
        _category(),
      ],
    );
  }

  Widget _category() {
    return Container(
        margin: EdgeInsets.only(left: 8, right: 8),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          image: new DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "https://www.theflavorbender.com/wp-content/uploads/2019/01/Easy-Chicken-Ramen-FB.jpg")),
        ),
        child: Container(
            margin: EdgeInsets.only(top: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: (Radius.circular(24)),
                  bottomRight: (Radius.circular(24))),
              color: Color(0x806C804B),
            ),
            child: Container(
                margin: EdgeInsets.only(left: 20, top: 6),
                child: Text(
                  'Asian food',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ))));
  }
}