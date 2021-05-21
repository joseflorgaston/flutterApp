


import 'package:flutter/cupertino.dart';

class HeaderCuadrado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0Xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {

  @override
  Widget build (BuildContext context){
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Color(0Xff615AAB),
          borderRadius: BorderRadius.horizontal(left: Radius.circular(50), right: Radius.circular(50))
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      /*color: Color(0xff615AAB),*/
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final pencil = Paint();
    // Propiedades
    pencil.color = Color(0Xff615AAB);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 5.0;

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.35);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint (CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final pencil = Paint();
    // Propiedades
    pencil.color = Color(0Xff615AAB);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 5.0;

    final path = Path();

    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint (CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPuntiagudo extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPuntiagudoPainter(),
      ),
    );
  }
}

class _HeaderPuntiagudoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final pencil = Paint();
    // Propiedades
    pencil.color = Color(0Xff615AAB);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 5.0;

    final path = Path();

    path.moveTo(0, size.height * 0.3);
    path.lineTo(size.width * 0.5, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint (CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(center: Offset(size.width * 0.5, 0.0), radius: 180);

    final Gradient gradient = new SweepGradient(
        center: FractionalOffset.center,
        startAngle: 0.0,
        endAngle: 10,
      colors: <Color>[
        Color(0xFF4285F4), // blue
        Color(0xFF34A853), // green
        Color(0xFFFBBC05), // yellow
        Color(0xFFEA4335), // red
        Color(0xFF4285F4), // blue again to seamlessly transition to the start
      ],
      stops: <double>[0.0, 0.25, 0.5, 0.75, 1.0],
      transform: GradientRotation(10),
    );

    final pencil = Paint()..shader = gradient.createShader(rect);
    // Propiedades
    pencil.color = Color(0Xff615AAB);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 25.0;

    final path = Path();

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.32, size.width * 0.5, size.height * 0.25);

    path.quadraticBezierTo(size.width * 0.75, size.height * 0.18, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}