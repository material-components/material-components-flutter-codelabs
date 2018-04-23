import 'package:flutter/material.dart';

import 'supplemental/asymmetric_grid.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        brightness: Brightness.light,
        leading: new IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            print('Menu button');
          },
        ),
        title: const Text('SHRINE'),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('Search button');
            },
          ),
          new IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      body: new ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(0.0, 34.0, 16.0, 44.0),
        children: buildGridCardsAsymmetric(context),
      ),
    );
  }
}
