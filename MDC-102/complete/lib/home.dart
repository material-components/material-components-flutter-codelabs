import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('Menu button');
            }),
        title: Text('SHRINE'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Search button');
              }),
          IconButton(
              icon: Icon(Icons.tune),
              onPressed: () {
                print('Tune button');
              }),
        ],
      ),
      body: Center(
        child: Text('You did it!'),
      ),
    );
  }
}
