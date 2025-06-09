import 'package:flutter/material.dart';

class DecorativePattern extends StatelessWidget {
  const DecorativePattern({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: PatternPainter(
        primary: Theme.of(context).colorScheme.primary.withOpacity(0.05),
        secondary: Theme.of(context).colorScheme.secondary.withOpacity(0.05),
      ),
    );
  }
}

class PatternPainter extends CustomPainter {
  final Color primary;
  final Color secondary;

  PatternPainter({
    required this.primary,
    required this.secondary,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw decorative circles
    final Paint circlePaint = Paint()..style = PaintingStyle.fill;
    
    // Top left decoration
    circlePaint.color = primary;
    canvas.drawCircle(
      Offset(0, size.height * 0.1),
      size.width * 0.2,
      circlePaint,
    );
    
    // Bottom right decoration
    circlePaint.color = secondary;
    canvas.drawCircle(
      Offset(size.width, size.height * 0.8),
      size.width * 0.3,
      circlePaint,
    );
    
    // Small details
    circlePaint.color = primary;
    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.2),
      size.width * 0.05,
      circlePaint,
    );
    
    circlePaint.color = secondary;
    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.7),
      size.width * 0.08,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
} 