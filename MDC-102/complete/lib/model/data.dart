import 'product.dart';

List<Product> getAllProducts() {
  return <Product>[
    Product(
        category: Category.home,
        id: 0,
        isFeatured: true,
        name: 'Tab Can',
        price: 35),
    Product(
      category: Category.accessories,
      id: 1,
      isFeatured: false,
      name: 'Pineapple Wallpaper',
      price: 80,
    ),
    Product(
      category: Category.clothing,
      id: 2,
      isFeatured: false,
      name: 'Tab & Fresca Cooler',
      price: 100,
    ),
    Product(
      category: Category.home,
      id: 3,
      isFeatured: false,
      name: 'Capris',
      price: 5,
    ),
  ];
}
