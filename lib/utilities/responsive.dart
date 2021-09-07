import 'package:flutter/material.dart';
import 'dart:math' as math;
class Responsive {
  late double _width, _height, _diagonal;
  late bool _isTablet;

  // getters
  double get width => _width; 
  double get height => _height; 
  double get diagonal => _diagonal; 
  bool get isTablet => _isTablet;

  // funcion estatica que retorna instancia de la clase responsive
  static Responsive of(BuildContext context) => Responsive(context);
  
  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    this._width = size.width;
    this._height = size.height;

    // c² = a²+b² => c = sqrt(a²+b²)
    this._diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));

    this._isTablet = size.shortestSide >=600;
  }

  // porcentaje de las medidas de ancho, alto y diagonal 
  double wp(double percent) => _width*percent/100; 
  double hp(double percent) => _height*percent/100; 
  double dp(double percent) => _diagonal*percent/100;
}