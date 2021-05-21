


import 'package:custom_painter/pages/animation_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

class CuadradoAnimadoPage extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Center(
          child: _CuadradoAnimado()
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget{

  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();

}

class __CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;
  late Animation<double> opacidadOut;
  late Animation<double> moveLeft;
  late Animation<double> moveRight;
  late Animation<double> moveUp;
  late Animation<double> moveDown;

  late Animation<double> scale;


  @override
  void initState() {
    controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(milliseconds: 4000),
    );

    /*rotacion = Tween(begin: 0.0 , end: 2*Math.pi ).animate(
        CurvedAnimation(parent: controller, curve: Curves.elasticOut)
    );
    opacidad = Tween(begin: 0.1 , end: 1.0 ).animate(
        CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.easeOut))
    );
    opacidadOut = Tween(begin: 0.0 , end: 1.0 ).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.6, 1.0, curve: Curves.easeOut))
    );
    scale = Tween(begin: 0.0 , end: 2.0 ).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );*/

    moveRight = Tween(begin: 0.1 , end: 100.0 ).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.0, 0.25, curve: Curves.easeOut))
    );
    moveUp = Tween(begin: 0.1 , end: -200.0 ).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.25, 0.5, curve: Curves.easeOut))
    );
    moveLeft = Tween(begin: 0.1 , end: 200.0 ).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.5, 0.75, curve: Curves.easeOut))
    );
    moveDown = Tween(begin: 0.1 , end: -400.0 ).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.easeOut))
    );

    controller.addListener(() {
      if( controller.status == AnimationStatus.completed) {
        /*controller.repeat();*/
        /*controller.reverse();*/
        controller.reset();
      } /*else if (controller.status == AnimationStatus.dismissed) {
        controller.forward();
      }*/
    });

    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(animation: controller, child: _Rectangulo() , builder: (BuildContext context, Widget) {
      return Transform.translate(
        offset: Offset(moveRight.value - moveLeft.value, moveUp.value - moveDown.value),
        child: _Rectangulo(),
      );
    });
  }
}


class _Rectangulo extends StatelessWidget{

  @override
  Widget build (BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.blue
      ),
    );
  }
}