enum Category {
  none,
  accessories,
  clothing,
  home
}

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

  const Product(this.category, this.id, this.isFeatured, this.name, this.price);

  @override
  String toString() => "$name (id=$id)";
}
