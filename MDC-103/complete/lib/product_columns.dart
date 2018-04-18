import 'package:flutter/material.dart';

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
    return new LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      const spacerHeight = 44.0;

      double heightOfCards = (constraints.biggest.height - spacerHeight) / 2.0;
      double heightOfImages = heightOfCards - ProductCard.kTextBoxHeight;
      double imageAspectRatio = constraints.biggest.width / heightOfImages;

      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            padding: const EdgeInsetsDirectional.only(start: 28.0),
            child: top != null
                ? new ProductCard(
                    imageAspectRatio: imageAspectRatio,
                    product: top,
                  )
                : new SizedBox(
                    height: heightOfCards,
                  ),
          ),
          const SizedBox(height: spacerHeight),
          new Container(
            padding: const EdgeInsetsDirectional.only(end: 28.0),
            child: new ProductCard(
              imageAspectRatio: imageAspectRatio,
              product: bottom,
            ),
          ),
        ],
      );
    });
  }
}

class OneProductCardColumn extends StatelessWidget {
  OneProductCardColumn({this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new ProductCard(
          product: product,
        ),
        const SizedBox(
          height: 40.0,
        ),
      ],
    );
  }
}
