import 'package:flutter/material.dart';

import 'dart:math';

class ClockPaint extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;
  ClockPaint(this.context, this.dateTime);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

// Second Calculation
    double secondX =
        centerX + size.width * 0.3 * cos((dateTime.second * 6) * pi / 180);
    double secondY =
        centerY + size.width * 0.3 * sin((dateTime.second * 6) * pi / 180);

// Hour Calculation
    double hourX = centerX +
        size.width *
            0.25 *
            cos((dateTime.hour * 30 + dateTime.hour * 0.5) * pi / 180);
    double hourY = centerY +
        size.width *
            0.25 *
            sin((dateTime.hour * 30 + dateTime.hour * 0.5) * pi / 180);

// Minites Calculation
    double minX =
        centerX + size.width * 0.3 * cos((dateTime.minute * 6) * pi / 180);
    double minY =
        centerY + size.width * 0.3 * sin((dateTime.minute * 6) * pi / 180);

// Hour Line
    canvas.drawLine(
        center,
        Offset(hourX, hourY),
        Paint()
          ..color = Theme.of(context).colorScheme.secondary
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5);
// Minites Line
    canvas.drawLine(
        center,
        Offset(minX, minY),
        Paint()
          ..color = Theme.of(context).colorScheme.onBackground.withOpacity(.5)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5);
// Second Line
    canvas.drawLine(center, Offset(secondX, secondY),
        Paint()..color = Theme.of(context).primaryColor);
// Center Dots
    Paint dotColor = Paint()..color = Theme.of(context).primaryIconTheme.color!;
    canvas.drawCircle(center, 24, dotColor);
    canvas.drawCircle(
        center, 23, Paint()..color = Theme.of(context).colorScheme.background);
    canvas.drawCircle(center, 10, dotColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
