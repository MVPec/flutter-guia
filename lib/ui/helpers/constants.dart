import 'package:flutter/material.dart';

// primary color of the entire App
Map<int, Color> color = {
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
};

MaterialColor customPrimaryColor = MaterialColor(0xfff000000, color);


// secondary color of the entire App
Color customSecondaryColor =  Color(0xfff000000);

Color transparent = Color(0x00000000);



// TextFormField color

  final colorBorder = Color(0xffE6E6E6);
  final colorText = Color(0xff9E9E9E);
  final colorErrorBorder = Colors.red;

// btn color facebook
  final colorFacebook = Color(0xff3b5998);

// final color Google
  final colorGoogle = Colors.red;


//Stilo de texto 

  TextStyle titlePrimary = TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 20.0, fontWeight: FontWeight.bold);


// estilo botones de color blanco
  TextStyle textBtnWhite = TextStyle(color: colorFacebook, fontFamily: 'Poppins', fontSize: 20.0, fontWeight: FontWeight.bold);

  TextStyle defaultStyleTC( double fontSize){
    return TextStyle(fontSize: fontSize, color: Colors.white70,);
  }
  TextStyle defaultStyleTCC = TextStyle(fontSize: 12, color: customPrimaryColor,);

  TextStyle styleTextLink(double fontSize, Color color){
    return TextStyle(fontSize: fontSize, color: color, fontFamily:'Poppins');
  }