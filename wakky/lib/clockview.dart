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

    // paints for the circles
    var innerCircle = Paint()..color = const Color(0xff444975);
    var outterCircle = Paint()
      ..color = const Color(0xffeaecff) //the color of the outter circle
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12; // the width of the brush for outter circle

    var smallInner = Paint()..color = const Color(0xffeaecff);

    // second, minuite and hour hand brush
    var secHand = Paint()
      ..color = const Color(0xffffcc80)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round //make the rectangle shape round
      ..strokeWidth = 4;

    var minHand = Paint()
      ..shader = const RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    //the canvas => note that canvas follows a stack format, so what you see first
    //should be positioned last, that's why the canvas for the smallInner was positioned last
    canvas.drawCircle(center, radius - 40, outterCircle);
    canvas.drawCircle(center, radius - 40, innerCircle);
    canvas.drawLine(center, const Offset(130, 100), secHand);
    canvas.drawLine(center, const Offset(142, 130), minHand);

    //positioned last cos its ontop of the sec, min and hour hand
    canvas.drawCircle(center, 10, smallInner);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
