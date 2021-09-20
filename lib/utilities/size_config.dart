import 'package:flutter/widgets.dart';
import 'dart:math' as math;
class SizeConfig {
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _screenDiagonal;

  static double _blockWidth = 0;
  static double _blockHeight = 0; 
  static double _blockDiagonal = 0;

  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier; 
  static late double widthMultiplier;  
  static late double diagonalMultiplier; 

  static bool isPortrait=true; 
  static bool isMobilePortrait=false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight; 
      isPortrait = true; 
      if(_screenWidth < 450){
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth; 
      isPortrait = false; 
      isMobilePortrait = false;
    }

    _screenDiagonal = math.sqrt(math.pow(_screenWidth, 2) + math.pow(_screenHeight, 2));

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100; 
    _blockDiagonal = _screenDiagonal / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth; 
    diagonalMultiplier = _blockDiagonal;

    //print(_blockWidth); 
    //print(_blockHeight);
  }
}
