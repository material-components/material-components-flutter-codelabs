// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/data.dart';
import 'model/product.dart';

class HomePage extends StatelessWidget {

  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = getAllProducts();

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = new NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return new Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new AspectRatio(
              aspectRatio: 18 / 11,
              child: new Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            new Expanded(
              child: new Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // TODO(larche): Make headline6 when available
                    new Text(
                      product.name,
                      style: theme.textTheme.title,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8.0),
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
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
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
        child: new GridView.count(
          crossAxisCount: 2,
          children: _buildGridCards(context),
          padding: const EdgeInsets.all(16.0),
          mainAxisSpacing: 8.0,
          childAspectRatio: 8.0 / 9.0,
        ),
      ),
    );
  }
}
