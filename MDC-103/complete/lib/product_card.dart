import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';

class ProductCard extends StatelessWidget {
  ProductCard({this.imageAspectRatio: 33 / 49, this.product})
      : assert(imageAspectRatio == null || imageAspectRatio > 0);

  final double imageAspectRatio;
  final Product product;

  static final kTextBoxHeight = 45.0;

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = new NumberFormat.simpleCurrency(
        decimalDigits: 0, locale: Localizations.localeOf(context).toString());
    final ThemeData theme = Theme.of(context);

    final imageWidget = new Image.asset(
      'assets/${product.id}-1.jpg',
      fit: BoxFit.cover,
    );

    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new AspectRatio(
          aspectRatio: imageAspectRatio,
          child: imageWidget,
        ),
        new Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
          child: SizedBox(
            height: kTextBoxHeight * MediaQuery.of(context).textScaleFactor,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // TODO(larche): Make headline6 when available
                new Text(
                  product == null ? '' : product.name,
                  style: theme.textTheme.title,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 8.0),
                // TODO(larche): Make subtitle2 when available
                new Text(
                  product == null ? '' : formatter.format(product.price),
                  style: theme.textTheme.subhead,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
