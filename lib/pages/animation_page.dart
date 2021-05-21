


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationPage extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Center(child: CuadradoAnimado()),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;
  late Animation<double> opacidadOut;
  late Animation<double> moveRight;
  late Animation<double> scale;


  @override
  void initState() {
    controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(milliseconds: 4000),
    );

    rotacion = Tween(begin: 0.0 , end: 2*Math.pi ).animate(
        CurvedAnimation(parent: controller, curve: Curves.elasticOut)
    );
    opacidad = Tween(begin: 0.1 , end: 1.0 ).animate(
        CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.easeOut))
    );
    opacidadOut = Tween(begin: 0.0 , end: 1.0 ).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.6, 1.0, curve: Curves.easeOut))
    );
    moveRight = Tween(begin: 0.1 , end: 200.0 ).animate(
        controller
    );
    scale = Tween(begin: 0.0 , end: 2.0 ).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut)
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
        offset: Offset(moveRight.value, 0.0),
        child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidad.value - opacidadOut.value,
              child: Transform.scale(
                scale: scale.value,
                  child: _Rectangulo()
              ),
            )
        ),
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