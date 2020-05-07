import 'package:flutter/material.dart';

import 'dart:math' as math;

class Responsive{

  double _width, _height, _inch;

  Responsive(BuildContext context){

    final _size = MediaQuery.of(context).size;

    _width = _size.width;
    _height = _size.height;

    // c2=a2+b2 => sqrt(a2+b2)
    _inch = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));


  }


  double wp(double percent){
    return _width * percent / 100;
  }


  double hp(double percent){
    return _height * percent / 100;
  }

  double ip(double percent){
    return _inch * percent / 100;
  }



}