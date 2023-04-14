import "dart:async";
import "dart:math";

import "package:flutter/material.dart";

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(const Duration(), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.amber,

      //we need to put the CustomPaint widget in a Transform widget and
      //rotate the children anticlockwise by 90deg so the widget will assum a real life clock position
      child: Transform.rotate(
        //bcos flutter canvas starts its y-axis from the top left, we have to put the negative pi
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

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
    // second handBrush
    var secHand = Paint()
      ..color = const Color(0xffffcc80)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round //make the rectangle shape round
      ..strokeWidth = 4;

    // minute handBrush
    var minHand = Paint()
      ..shader = const RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    // hour handBrush
    var hourHand = Paint()
      ..shader = const RadialGradient(
              colors: [Color.fromARGB(255, 202, 68, 255), Colors.orange])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

    //the canvas => note that canvas follows a stack format, so what you see first
    //should be positioned last, that's why the canvas for the smallInner was positioned last
    canvas.drawCircle(center, radius - 40, outterCircle);
    canvas.drawCircle(center, radius - 40, innerCircle);

    //calculation for the hour hand
    //note, bcos we need to convert the values from their original degree values to radiant (pi/180)
    var hourHandX = centerX +
        30 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerY +
        30 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHand);

    //calculation for the minute hand
    //note, bcos we need to convert the values from their original degree values to radiant (pi/180)
    var minHandX = centerX + 50 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerY + 50 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHand);

    //calculation for the seconds hand
    //note, bcos we need to convert the values from their original degree values to radiant (pi/180)
    var secHandX = centerX + 70 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerY + 70 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHand);

    //positioned last cos its ontop of the sec, min and hour hand
    canvas.drawCircle(center, 10, smallInner);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
