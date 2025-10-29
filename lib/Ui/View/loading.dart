import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/Constants/app_colors.dart';

class RetroLoadingScreen extends StatelessWidget {
  const RetroLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDark,
      body: const Center(child: RetroCircularLoader()),
    );
  }
}

class RetroCircularLoader extends StatefulWidget {
  final double size;
  final int segments;
  final Duration cycleDuration;

  const RetroCircularLoader({
    super.key,
    this.size = 120,
    this.segments = 4,
    this.cycleDuration = const Duration(milliseconds: 1800),
  });

  @override
  State<RetroCircularLoader> createState() => _RetroCircularLoaderState();
}

class _RetroCircularLoaderState extends State<RetroCircularLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.cycleDuration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _CircularGlowPainter(
              progress: _controller.value,
              segments: widget.segments,
            ),
          );
        },
      ),
    );
  }
}

class _CircularGlowPainter extends CustomPainter {
  final double progress;
  final int segments;

  _CircularGlowPainter({required this.progress, required this.segments});

  final Color glowColor = Colors.white;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.3;
    final baseStroke = size.width * 0.045;

    final rotation = progress * 2 * pi;

    final glowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = baseStroke
      ..color = glowColor.withOpacity(0.9)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    final corePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = baseStroke
      ..color = glowColor;

    // Split animation (arcs morph into dots)
    double splitAnim = (sin(progress * 2 * pi) + 1) / 2;
    splitAnim = pow(splitAnim, 3).toDouble();

    for (int i = 0; i < segments; i++) {
      final segPhase = (i / segments) * 2 * pi;
      final angle = rotation + segPhase;

      final arcLength = lerpDouble(pi / 4, 0.12, splitAnim)!;
      final outward = lerpDouble(0, radius * 0.18, splitAnim)!;

      final r = radius + outward;
      final rect = Rect.fromCircle(center: center, radius: r);
      final start = angle - arcLength / 2;

      if (arcLength <= 0.18) {
        // Draw dot form
        final dotPos = Offset(
          center.dx + r * cos(angle),
          center.dy + r * sin(angle),
        );

        final glowCircle = Paint()
          ..style = PaintingStyle.fill
          ..color = glowColor.withOpacity(0.9)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

        final coreCircle = Paint()
          ..style = PaintingStyle.fill
          ..color = glowColor;

        canvas.drawCircle(dotPos, baseStroke * 0.45, glowCircle);
        canvas.drawCircle(dotPos, baseStroke * 0.25, coreCircle);
      } else {
        // Draw arc form
        canvas.drawArc(rect, start, arcLength, false, glowPaint);
        canvas.drawArc(rect, start, arcLength, false, corePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _CircularGlowPainter oldDelegate) =>
      oldDelegate.progress != progress;

  double? lerpDouble(num? a, num? b, double t) {
    if (a == null && b == null) return null;
    a = a ?? 0;
    b = b ?? 0;
    return a + (b - a) * t;
  }
}
