import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';

class ProductCard extends StatelessWidget {
  ProductCard({this.product}) : assert(product != null);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = new NumberFormat.simpleCurrency(
        decimalDigits: 0, locale: Localizations.localeOf(context).toString());
    final ThemeData theme = Theme.of(context);

    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
            new Image.asset(
                'assets/${product.id}-1.jpg',
                fit: BoxFit.cover,
              ),
        new Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // TODO(larche): Make headline6 when available
              new Text(
                product == null ? '' : product.name,
                style: theme.textTheme.title,
                maxLines: 1,
              ),
              const SizedBox(height: 8.0),
              // TODO(larche): Make subtitle2 when available
              new Text(
                product == null ? '' : formatter.format(product.price),
                style: theme.textTheme.body2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
