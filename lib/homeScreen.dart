import 'package:flutter/material.dart';
import 'bottomAppBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(child: MyAppBar()),
    );
  }
}
