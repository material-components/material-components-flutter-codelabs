// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

import '../model/product.dart';
import 'product_card.dart';

class TwoProductCardColumn extends StatelessWidget {
  TwoProductCardColumn({
    required this.bottom,
    this.top,
  });

  final Product bottom;
  final Product? top;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      const spacerHeight = 44.0;

      double heightOfCards = (constraints.biggest.height - spacerHeight) / 2.0;
      double heightOfImages = heightOfCards - ProductCard.kTextBoxHeight;
      // TODO: Change imageAspectRatio calculation (104)
      double imageAspectRatio = constraints.biggest.width / heightOfImages;

      // TODO: Replace Column with a ListView (104)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.only(start: 28.0),
            child: top != null
                ? ProductCard(
                    imageAspectRatio: imageAspectRatio,
                    product: top!,
                  )
                : SizedBox(
                    height: heightOfCards,
                  ),
          ),
          SizedBox(height: spacerHeight),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 28.0),
            child: ProductCard(
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
  OneProductCardColumn({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    // TODO: Replace Column with a ListView (104)
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ProductCard(
          product: product,
        ),
        SizedBox(
          height: 40.0,
        ),
      ],
    );
  }
}
