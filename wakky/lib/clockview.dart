import "dart:math";

import "package:flutter/material.dart";

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.amber,
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //point's coordinates
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var innerCircle = Paint()..color = const Color(0xff444975);
    var outterCircle = Paint()
      ..color = const Color(0xffeaecff) //the color of the outter circle
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12; // the width of the brush for outter circle

    canvas.drawCircle(center, radius - 40, outterCircle);
    canvas.drawCircle(center, radius - 40, innerCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
