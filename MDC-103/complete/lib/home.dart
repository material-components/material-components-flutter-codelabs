import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/data.dart';
import 'model/product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Container> _buildGridCards() {
    List<Product> products = getAllProducts();

    if (products == null || products.isEmpty) {
      return const <Container>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Container(width: 160.0, child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18 / 11,
            child: Image.asset(
              'assets/${product.id}-1.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // TODO(larche): Make headline6 when available
                  new Text(
                    product.name,
                    style: theme.textTheme.title,
                    maxLines: 1,
                  ),
                  SizedBox(height: 8.0),
                  // TODO(larche): Make subtitle2 when available
                  new Text(
                    formatter.format(product.price),
                    style: theme.textTheme.body2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            print('Menu button');
          },
        ),
        title: const Text('SHRINE'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      body: Center(
        child: ListView(scrollDirection: Axis.horizontal, children: _buildGridCards(),)
      ),
    );
  }
}
