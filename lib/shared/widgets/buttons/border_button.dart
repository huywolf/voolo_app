// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget {
  final GradientPainter _painter;
  final String _text;
  final Widget? _child;
  final VoidCallback? _callback;
  final double _radius;
  final Color backgroundColor;

  BorderButton({
    super.key,
    double strokeWidth = 1,
    double radius = 22,
    Gradient? gradient,
    String text = "",
    Widget? child,
    VoidCallback? onPressed,
    this.backgroundColor = Colors.transparent,
  })  : _painter = GradientPainter(
          strokeWidth: strokeWidth,
          radius: radius,
          gradient: gradient ??
              const LinearGradient(
                colors: [
                  Color(0xff405FA3),
                  Color(0xff1ED69D),
                ],
              ),
        ),
        _child = child,
        _callback = onPressed,
        _radius = radius,
        _text = text;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _callback,
        child: InkWell(
          borderRadius: BorderRadius.circular(_radius),
          onTap: _callback,
          child: Container(
            decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(_radius)),
            constraints: const BoxConstraints(minWidth: 88, minHeight: 64),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_text != "")
                  Text(
                    _text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2F9AA0),
                    ),
                  )
                else
                  _child!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  GradientPainter({
    required double strokeWidth,
    required double radius,
    required Gradient gradient,
  })  : strokeWidth = strokeWidth,
        radius = radius,
        gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect = RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth, size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
