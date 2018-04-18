import 'package:flutter/material.dart';

import '../model/data.dart';
import '../model/product.dart';
import '../product_columns.dart';

List<Container> buildGridCardsAsymmetric(BuildContext context) {
  List<Product> products = getAllProducts();
  if (products == null || products.isEmpty) {
    return const <Container>[];
  }

  return List.generate(listItemCount(products.length), (int index) {
    double width = .59 * MediaQuery.of(context).size.width;
    Widget column;
    if (index % 2 == 0) {
      /// Even cases
      int bottom = evenCasesIndex(index);
      column = new TwoProductCardColumn(
          bottom: products[bottom],
          top: products.length - 1 >= bottom + 1 ? products[bottom + 1] : null);
      width += 32.0;
    } else {
      /// Odd cases
      column = new OneProductCardColumn(
        product: products[oddCasesIndex(index)],
      );
    }
    return new Container(
      width: width,
      child: new Padding(
        padding: new EdgeInsets.symmetric(horizontal: 16.0),
        child: column,
      ),
    );
  }).toList();
}

int evenCasesIndex(int input) {
  return input ~/ 2 * 3;
}

int oddCasesIndex(int input) {
  return (input / 2).ceil() * 3 - 1;
}

int listItemCount(int totalItems) {
  if (totalItems % 3 == 0) {
    return totalItems ~/ 3 * 2;
  } else {
    return (totalItems / 3).ceil() * 2 - 1;
  }
}

