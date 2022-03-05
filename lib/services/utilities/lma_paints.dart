import 'package:flutter/material.dart';
import 'package:baker_app/presentation/styles/colors.dart';

class ProgressPainter extends CustomPainter {
  Color color;
  final double extent;
  final double borderRadius;

  ProgressPainter({
    this.color = BakerColors.white,
    this.extent = 0,
    required this.borderRadius,
  }) : assert(extent >= 0 && extent <= 1);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = size.height
      ..style = PaintingStyle.fill;

    canvas.drawPath(_strokeButt(size), paint);
  }

  Path _strokeButt(Size size) {
    final path = Path();
    double x = size.width;
    double y = size.height;
    double widthFraction = x * extent;
    path.addRRect(
      RRect.fromLTRBR(
        0,
        0,
        widthFraction,
        y,
        Radius.circular(borderRadius),
      ),
    );

    return path;
  }

  @override
  bool shouldRepaint(ProgressPainter oldDelegate) {
    return oldDelegate.extent != extent;
  }
}
