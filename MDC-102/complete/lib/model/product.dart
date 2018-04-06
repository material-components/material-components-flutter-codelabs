import 'package:flutter/foundation.dart';

enum Category { none, accessories, clothing, home }

class Product {
  final Category category;

  /// The unique identifier of the product.
  final int id;

  /// Whether the product will be shown in the Featured section.
  final bool isFeatured;

  /// The default text to display.
  final String name;

  /// The price of the item.
  final double price;

  /// Formatted currency representation of price. Localized if possible.
  final String priceString;

  const Product({
      @required this.category,
      @required this.id,
      @required this.isFeatured,
      @required this.name,
      @required this.price,
      @required this.priceString});

  @override
  String toString() => "$name (id=$id)";
}
