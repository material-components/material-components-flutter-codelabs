import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotchedCornerBorder extends OutlineInputBorder {
  const NotchedCornerBorder({
    BorderSide borderSide: BorderSide.none,
    this.cut: 7.0,
  }) : super(borderSide: borderSide, borderRadius: BorderRadius.all(Radius.circular(2.0)), gapPadding: 2.0);

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

  Path _notchedCornerPath(Rect center,
      [double start = 0.0, double extent = 0.0]) {
    final Path path = new Path();
    if (start > 0.0 || extent > 0.0) {
      path.relativeMoveTo(extent + start, center.top);
      _notchedSidesAndBottom(center, path);
      path.lineTo(start, center.top + start / cut);
    } else {
      path.moveTo(center.left + cut, center.top);
      _notchedSidesAndBottom(center, path);
      path.lineTo(center.left + cut, center.top);
    }
    return path;
  }

  Path _notchedSidesAndBottom(Rect center, Path path) {
    return path
      ..lineTo(center.right - cut, center.top)
      ..lineTo(center.right, center.top + cut)
      ..lineTo(center.right, center.top + center.height - cut)
      ..lineTo(center.right - cut, center.top + center.height)
      ..lineTo(center.left + cut, center.top + center.height)
      ..lineTo(center.left, center.top + center.height - cut)
      ..lineTo(center.left, center.top + cut);
  }

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double gapStart,
    double gapExtent: 0.0,
    double gapPercentage: 0.0,
    TextDirection textDirection,
  }) {
    assert(gapExtent != null);
    assert(gapPercentage >= 0.0 && gapPercentage <= 1.0);

    final Paint paint = borderSide.toPaint();
    final RRect outer = borderRadius.toRRect(rect);
    if (gapStart == null || gapExtent <= 0.0 || gapPercentage == 0.0) {
      canvas.drawPath(_notchedCornerPath(outer.middleRect), paint);
    } else {
      final double extent =
          lerpDouble(0.0, gapExtent + gapPadding * 2.0, gapPercentage);
      switch (textDirection) {
        case TextDirection.rtl:
          {
            final Path path = _notchedCornerPath(
                outer.middleRect, gapStart + gapPadding - extent, extent);
            canvas.drawPath(path, paint);
            break;
          }
        case TextDirection.ltr:
          {
            final Path path = _notchedCornerPath(
                outer.middleRect, gapStart - gapPadding, extent);
            canvas.drawPath(path, paint);
            break;
          }
      }
    }
  }
}
