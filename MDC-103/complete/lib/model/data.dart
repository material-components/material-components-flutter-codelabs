import 'dart:async';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';

import 'product.dart';

List<Product> getAllProducts() {
  return <Product>[
    new Product(
      category: Category.home,
      id: 0,
      isFeatured: true,
      name: 'Tab Can',
      price: 35,
    ),
    new Product(
      category: Category.accessories,
      id: 1,
      isFeatured: false,
      name: 'Pineapple Wall',
      price: 80,
    ),
    new Product(
      category: Category.clothing,
      id: 2,
      isFeatured: false,
      name: 'Tab & Fresca Cold',
      price: 100,
    ),
    new Product(
      category: Category.home,
      id: 3,
      isFeatured: false,
      name: 'Capris',
      price: 5,
    ),
  ];
}
