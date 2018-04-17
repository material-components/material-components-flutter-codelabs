import 'package:flutter/material.dart';

import 'model/data.dart';
import 'model/product.dart';
import 'product_card.dart';
import 'product_columns.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Container> _buildGridCards(BuildContext context) {
    List<Product> products = getAllProducts();

    if (products == null || products.isEmpty) {
      return const <Container>[];
    }

    int count;
    if (products.length % 3 == 0) {
      count = products.length ~/ 3 * 2;
    } else {
      count = (products.length / 3).ceil() * 2 - 1;
    }

    return List.generate(count, (int index) {
      double width;
      Widget column;
      if (index % 2 == 0) {
        /// Even cases
        int firstProductIndex = (index ~/ 2 * 3);
        column = TwoProductCardColumn(
            bottom: products[firstProductIndex],
            top: products.length - 1 >= firstProductIndex + 1
                ? products[firstProductIndex + 1]
                : null);
        width = 4 / 9 * MediaQuery.of(context).size.width + 32.0;
      } else {
        /// Odd cases
        column = ProductCard(
          product: products[(index / 2).ceil() * 3 - 1],
        );
        width = 4 / 9 * MediaQuery.of(context).size.width;
      }
      return new Container(
        width: width,
        child: new Padding(
          padding: EdgeInsetsDirectional.only(start: 16.0),
          child: column,
        ),
      );
    }).toList();
  }

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
      body: new Center(
        child: new ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.fromLTRB(0.0, 56.0, 16.0, 40.0),
          children: _buildGridCards(context),
        ),
      ),
    );
  }
}
