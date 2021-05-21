

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  double percentage = 50;

  @override
  Widget build(BuildContext context) {
    return Center();
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}

class CircularProgressPageState extends State<CircularProgressPage> {

  var percentage = 10;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
        onPressed: () {

          percentage += 10;
          if ( percentage > 100) {
            percentage = 0;
          }
          setState(() {});
        },
      ),
      backgroundColor: Colors.yellowAccent,
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.transparent,
          child: CustomPaint(
              painter: _RadialProgressPainter(percentage: 50)
          ),
        ),
      ),
      /*child: */
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _RadialProgressPainter extends CustomPainter {
  final percentage;

  _RadialProgressPainter( {this.percentage});
  @override
  void paint(Canvas canvas, Size size) {


    final pencil = new Paint();
    pencil.strokeWidth = 4;
    pencil.color = Colors.lightBlueAccent;
    pencil.style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height * 0.5);
    double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, pencil);

    final pencilBow = new Paint()
    ..strokeWidth = 8
    ..color = Colors.pink
    ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radio),
        -pi / 2,
        arcAngle,
        false,
        pencilBow
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}