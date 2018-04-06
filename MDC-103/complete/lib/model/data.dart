import 'dart:async';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';

import 'product.dart';

NumberFormat formatter;

Future<String> getLocale() async {
  var localeString = await findSystemLocale();
  return localeString;
}

List<Product> generateProducts(NumberFormat formatter) {
  if (formatter == null) {
    formatter = NumberFormat.simpleCurrency(decimalDigits: 0);
  }

  return <Product>[
    Product(
        category: Category.home,
        id: 0,
        isFeatured: true,
        name: 'Tab Can',
        price: 35.0,
        priceString: formatter.format(35.0)),
    Product(
        category: Category.accessories,
        id: 1,
        isFeatured: false,
        name: 'Pineapple Wall',
        price: 80.2,
        priceString: formatter.format(80.2)),
    Product(
        category: Category.clothing,
        id: 2,
        isFeatured: false,
        name: 'Tab & Fresca Cold',
        price: 100.0,
        priceString: formatter.format(100.0)),
    Product(
        category: Category.home,
        id: 3,
        isFeatured: false,
        name: 'Capris',
        price: 5.0,
        priceString: formatter.format(5.0)),
  ];
}
