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
  return <Product>[
    Product(
        category: Category.home,
        id: 0,
        isFeatured: true,
        name: 'Tab Can',
        price: 35,
        priceString: formatter.format(35)),
    Product(
        category: Category.accessories,
        id: 1,
        isFeatured: false,
        name: 'Pineapple Wallpaper',
        price: 80,
        priceString: formatter.format(80)),
    Product(
        category: Category.clothing,
        id: 2,
        isFeatured: false,
        name: 'Tab & Fresca Cooler',
        price: 100,
        priceString: formatter.format(100)),
    Product(
        category: Category.home,
        id: 3,
        isFeatured: false,
        name: 'Capris',
        price: 5,
        priceString: formatter.format(5)),
  ];
}
