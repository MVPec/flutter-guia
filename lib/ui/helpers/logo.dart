import 'package:flutter/material.dart';

Widget logoWhite( Widget img, double sizeW) {
  return Container(
    alignment: Alignment.center,
    //constraints: BoxConstraints.expand(height: size),
    width:sizeW,
    child: img,
  );
}
