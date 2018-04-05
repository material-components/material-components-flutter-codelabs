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

  final String priceString;

  const Product(category, id, isFeatured, name, price, priceString)
      : category = category,
        id = id,
        isFeatured = isFeatured,
        name = name,
        price = price,
        priceString = priceString;

  @override
  String toString() => "$name (id=$id)";
}
