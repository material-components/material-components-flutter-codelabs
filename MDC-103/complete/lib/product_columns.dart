import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';
import 'product_card.dart';

class TwoProductCardColumn extends StatelessWidget {
  TwoProductCardColumn({
    this.bottom,
    this.top,
  }) : assert(bottom != null);

  final Product bottom, top;

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsetsDirectional.only(start: 56.0),
          child: new ProductCard(
            imageAspectRatio: 18 / 11,
            product: top,
          ),
        ),
        const SizedBox(height: 56.0),
        new Padding(
          padding: const EdgeInsetsDirectional.only(end: 56.0),
          child: new ProductCard(
            imageAspectRatio: 18 / 11,
            product: bottom,
          ),
        ),
      ],
    );
  }
}
