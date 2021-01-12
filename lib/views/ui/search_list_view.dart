import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/my_app_bar.dart';
import '../../lists/search_list.dart';
import '../../models/model.dart';

class SearchListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF6C804B)),
        elevation: 0,
        title: Text('Recipes Found',
            style: TextStyle(color: Color(0xFF6C804B), fontSize: 20)),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        child: MyAppBar(),
      ),
      body: Consumer<MyState>(
          builder: (context, state, child) => SearchList(state.recipes)),
    );
  }
}
