import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/data.dart';
import 'model/product.dart';

List<Card> _buildGridCards(BuildContext context, List<Product> products) {
  if (products == null || products.isEmpty) {
    return [];
  }

  final ThemeData theme = Theme.of(context);
  final NumberFormat formatter = NumberFormat.simpleCurrency(locale: Localizations.localeOf(context).toString());
  return List.generate(products.length, (int index) {
    return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 11,
                child: Image.asset(
                  'assets/${products[index].id}-1.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // TODO(larche): Make headline6 when available
                      Text(
                        products[index].name,
                        style: theme.textTheme.title,
                        maxLines: 1,
                      ),
                      SizedBox(height: 8.0),
                      // TODO(larche): Make subtitle2 when available
                      Text(
                        formatter.format(products[index].price),
                        style: theme.textTheme.body2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );}
  ).toList();
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> allProducts = getAllProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print('Menu button');
          },
        ),
        title: Text('SHRINE'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(Icons.tune),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: _buildGridCards(
            context,
            allProducts,
          ),
          padding: EdgeInsets.all(16.0),
          mainAxisSpacing: 8.0,
          childAspectRatio: 8.0 / 9.0,
        ),
      ),
    );
  }
}
