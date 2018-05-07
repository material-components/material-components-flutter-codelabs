import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'model/product.dart';
import 'colors.dart';

class MenuPage extends StatelessWidget {
  final Category currentCategory;
  final ValueChanged<Category> onCategoryTap;
  final List<Category> _categories = Category.values;

  const MenuPage({
    Key key,
    @required this.currentCategory,
    this.onCategoryTap,
  }) : assert(currentCategory != null);

  Widget _buildCategory(Category category, BuildContext context) {
    var categoryString =
        category.toString().replaceAll('Category.', '').toUpperCase();
    return GestureDetector(
      onTap: () => onCategoryTap(category),
      child: category == currentCategory
          ? Column(
              children: <Widget>[
                SizedBox(height: 16.0),
                Text(
                  categoryString,
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Container(
                  width: 70.0,
                  height: 2.0,
                  color: Colors.pink[200],
                ),
                SizedBox(height: 4.0),
              ],
            )
          : Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                categoryString,
                style: Theme.of(context).textTheme.title.copyWith(
                      color: Colors.brown[300],
                    ),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var menuItems = <Widget>[];
    _categories.forEach((Category c) {
      menuItems.add(_buildCategory(c, context));
    });

    menuItems.add(Center(
      child: Container(
        width: 70.0,
        height: 1.0,
        color: Colors.brown[200],
      ),
    ));
    menuItems.add(
      Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          'MY ACCOUNT',
          style: Theme.of(context).textTheme.title.copyWith(
                color: Colors.brown[300],
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 40.0),
        color: kShrinePink100,
        child: ListView(children: menuItems),
      ),
    );
  }
}
