import 'package:flutter/material.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: const _Painter(),
      size: MediaQuery.of(context).size,
    );
  }
}

class _Painter extends CustomPainter {
  const _Painter();

  @override
  void paint(final Canvas canvas, final Size size) {
    final Paint paint = Paint();
    paint.color = const Color(0xFF0099FF).withOpacity(0.5);
    final Path path = Path();
    path.moveTo(0.0, size.height * 0.90);
    path.cubicTo(
      size.width * 0.33,
      size.height * 0.60,
      size.width * 0.66,
      size.height * 1.20,
      size.width,
      size.height * 0.70,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
