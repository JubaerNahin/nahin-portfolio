import 'package:flutter/material.dart';

class ProgressPainter extends CustomPainter {
  final double progress;
  final Color color;

  ProgressPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 3.0;

    final backgroundPaint = Paint()
      ..color = color.withValues(alpha: 0.2)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final foregroundPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(
          center: size.center(Offset.zero),
          radius: size.width / 2 - strokeWidth / 2),
      0,
      2 * 3.1416,
      false,
      backgroundPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(
          center: size.center(Offset.zero),
          radius: size.width / 2 - strokeWidth / 2),
      -3.1416 / 2,
      2 * 3.1416 * progress,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
