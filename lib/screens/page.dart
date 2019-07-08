import 'package:flutter/material.dart';

class Page extends StatelessWidget {

  final String title;

  Page(this.title);
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(title: new Text(title), backgroundColor: Colors.redAccent,),

      body: Center(
        child: Text(title),
      )


    );
  }
}