import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotchedCornerBorder extends OutlineInputBorder {
  const NotchedCornerBorder({
    BorderSide borderSide: BorderSide.none,
    this.cut: 7.0,
  }) :super(borderSide: borderSide);


  @override
  NotchedCornerBorder copyWith({
    BorderSide borderSide,
    BorderRadius borderRadius,
    double gapPadding,
  }) {
    return new NotchedCornerBorder(
      borderSide: borderSide ?? this.borderSide,
      cut: cut ?? this.cut,
    );
  }

  final double cut;

  Path _notchedCornerPath(Rect center,) {

    final Path path = new Path()
    ..moveTo(center.left + cut, center.top)
    ..lineTo(center.right - cut, center.top)
    ..lineTo(center.right, center.top + cut)
    ..lineTo(center.right, center.top + center.height - cut)
    ..lineTo(center.right - cut, center.top + center.height)
    ..lineTo(center.left + cut, center.top + center.height)
    ..lineTo(center.left, center.top + center.height - cut)
    ..lineTo(center.left, center.top + cut)
    ..close();
    return path;
  }

  Path _gapBorderPath(Canvas canvas, RRect center, double start, double extent) {
    final Path path = new Path();

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {
    double gapStart,
    double gapExtent: 0.0,
    double gapPercentage: 0.0,
    TextDirection textDirection,
  }) {
    assert(gapExtent != null);
    assert(gapPercentage >= 0.0 && gapPercentage <= 1.0);

    final Paint paint = borderSide.toPaint();
    final RRect outer = borderRadius.toRRect(rect);
    final RRect center = outer.deflate(borderSide.width / 2.0);
    if (gapStart == null || gapExtent <= 0.0 || gapPercentage == 0.0) {
      canvas.drawPath(_notchedCornerPath(center.middleRect), paint);
    } else {

      final double extent = lerpDouble(0.0, gapExtent + gapPadding * 2.0, gapPercentage);
      switch (textDirection) {
        case TextDirection.rtl: {
          final Path path = _gapBorderPath(canvas, center, gapStart + gapPadding - extent, extent);
          canvas.drawPath(path, paint);
          break;
        }
        case TextDirection.ltr: {
          final Path path = _gapBorderPath(canvas, center, gapStart - gapPadding, extent);
          canvas.drawPath(path, paint);
          break;
        }
      }
    }
  }
}
