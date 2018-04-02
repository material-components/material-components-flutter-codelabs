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

  /// A color associated with the product.
  final bool isFeatured;

  /// The default text to display.
  final String name;

  final double price;

  const Product(this.category, this.id, this.isFeatured, this.name, this.price);

  @override
  String toString() => "$name (id=$id)";
}
