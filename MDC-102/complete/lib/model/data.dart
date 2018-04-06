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
    formatter = NumberFormat.simpleCurrency();
  }

  return <Product>[
    Product(Category.home, 0, true, 'Tab Can', 35.0, formatter.format(35.0)),
    Product(Category.accessories, 1, false, 'Pineapple Wallpaper', 80.2,
        formatter.format(80.2)),
    Product(Category.clothing, 2, false, 'Tab & Fresca Cooler', 100.0,
        formatter.format(100.0)),
    Product(Category.home, 3, false, 'Capris', 5.0, formatter.format(5.0)),
  ];
}
