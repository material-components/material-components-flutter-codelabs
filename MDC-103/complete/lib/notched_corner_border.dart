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

    final Rect tlCorner = new Rect.fromLTWH(
      center.left,
      center.top,
      center.tlRadiusX * 2.0,
      center.tlRadiusY * 2.0,
    );
    final Rect trCorner = new Rect.fromLTWH(
      center.right - center.trRadiusX * 2.0,
      center.top,
      center.trRadiusX * 2.0,
      center.trRadiusY * 2.0,
    );
    final Rect brCorner = new Rect.fromLTWH(
      center.right - center.brRadiusX * 2.0,
      center.bottom - center.brRadiusY * 2.0,
      center.brRadiusX * 2.0,
      center.brRadiusY * 2.0,
    );
    final Rect blCorner = new Rect.fromLTWH(
      center.left,
      center.bottom - center.brRadiusY * 2.0,
      center.blRadiusX * 2.0,
      center.blRadiusY * 2.0,
    );

    const double cornerArcSweep = math.pi / 2.0;
    final double tlCornerArcSweep = start < center.tlRadiusX
        ? math.asin(start / center.tlRadiusX)
        : math.pi / 2.0;

    final Path path = new Path()
      ..addArc(tlCorner, math.pi, tlCornerArcSweep)
      ..moveTo(center.left + center.tlRadiusX, center.top);

    if (start > center.tlRadiusX)
      path.lineTo(center.left + start, center.top);

    const double trCornerArcStart = (3 * math.pi) / 2.0;
    const double trCornerArcSweep = cornerArcSweep;
    if (start + extent < center.width - center.trRadiusX) {
      path
        ..relativeMoveTo(extent, 0.0)
        ..lineTo(center.right - center.trRadiusX, center.top)
        ..addArc(trCorner, trCornerArcStart, trCornerArcSweep);
    } else if (start + extent < center.width) {
      final double dx = center.width - (start + extent);
      final double sweep = math.acos(dx / center.trRadiusX);
      path.addArc(trCorner, trCornerArcStart + sweep, trCornerArcSweep - sweep);
    }

    return path
      ..moveTo(center.right, center.top + center.trRadiusY)
      ..lineTo(center.right, center.bottom - center.brRadiusY)
      ..addArc(brCorner, 0.0, cornerArcSweep)
      ..lineTo(center.left + center.blRadiusX, center.bottom)
      ..addArc(blCorner, math.pi / 2.0, cornerArcSweep)
      ..lineTo(center.left, center.top + center.trRadiusY);
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
