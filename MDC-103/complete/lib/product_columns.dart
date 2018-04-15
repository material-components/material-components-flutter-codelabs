import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';

class TwoProductColumn extends StatelessWidget {
  TwoProductColumn({
    this.bottom,
    this.top,
  }) : assert(bottom != null);

  final Product bottom, top;

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = new NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    final ThemeData theme = Theme.of(context);

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new AspectRatio(
          aspectRatio: 18 / 11,
          child: new Image.asset(
            'assets/${bottom.id}-1.jpg',
            fit: BoxFit.fitWidth,
          ),
        ),
        new Expanded(
          child: new Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // TODO(larche): Make headline6 when available
                new Text(
                  bottom.name,
                  style: theme.textTheme.title,
                  maxLines: 1,
                ),
                const SizedBox(height: 8.0),
                // TODO(larche): Make subtitle2 when available
                new Text(
                  formatter.format(bottom.price),
                  style: theme.textTheme.body2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class OneProductColumn extends StatelessWidget {
  OneProductColumn({this.product}) : assert(product != null);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = new NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    final ThemeData theme = Theme.of(context);

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new AspectRatio(
          aspectRatio: 18 / 11,
          child: new Image.asset(
            'assets/${product.id}-1.jpg',
            fit: BoxFit.fitWidth,
          ),
        ),
        new Expanded(
          child: new Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // TODO(larche): Make headline6 when available
                new Text(
                  product.name,
                  style: theme.textTheme.title,
                  maxLines: 1,
                ),
                const SizedBox(height: 8.0),
                // TODO(larche): Make subtitle2 when available
                new Text(
                  formatter.format(product.price),
                  style: theme.textTheme.body2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
