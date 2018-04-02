class Product {
  /// The unique identifier of the product.
  final int id;

  /// The default text to display.
  final String name;

  /// A color associated with the product.
  final bool isFeatured;

  const Product(this.id, this.name, this.color);

  @override
  String toString() => "$name (id=$id)";
}
