import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:winncar/ui/helpers/constants.dart';


class GradientAppBarArrow extends StatelessWidget {
  //const GradientAppBar({Key key}) : super(key: key);

  final String title;
  final double barHeight = 60.0;

  final IconButton icon;
  

  GradientAppBarArrow(this.icon, this.title);


  @override

  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        height: statusBarHeight + barHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(  //Creamos el degradado
            colors: [
              customPrimaryColor,
              customSecondaryColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter, //posicion del segundo color del degradado
            //stops: [0.0, 0.0],// distribuims los colores en este caso se esta llenando de izquierda a drecha para ir de izquierda a la mitad de la barra usamos esto [0.0,0.5]
            //tileMode: TileMode.clamp // se usa si el stops no llena todo el area extendera el ultmio color 
          )
        ),
        child: Container(
          child: Row(
            children: <Widget>[
              Container(
                child: icon,
              ),
              Expanded(
                child: Container(
                  //alignment: FractionalOffset.centerRight,
                  child: Text(title,
                  style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500,fontSize: 20.0, color: Colors.white,),
                  textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),

          
          
        )
    );
  }
}


class GradientAppBar extends StatelessWidget {
  //const GradientAppBar({Key key}) : super(key: key);

  final String title;
  final double barHeight = 60.0;

  
  

  GradientAppBar(this.title);


  @override

  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        height: statusBarHeight + barHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(  //Creamos el degradado
            colors: [
              Color(0xFFffffff),
              Color(0xFFffffff),
            ],
            begin: FractionalOffset(0.0, 0.0), //posicion del primer color del degradado
            end: FractionalOffset(1.0, 0.0), //posicion del segundo color del degradado
            stops: [0.0, 1.0],// distribuims los colores en este caso se esta llenando de izquierda a drecha para ir de izquierda a la mitad de la barra usamos esto [0.0,0.5]
            tileMode: TileMode.clamp // se usa si el stops no llena todo el area extendera el ultmio color 
          ),
          /* boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              blurRadius: 0.0,
              spreadRadius: 1.0
            )
          ] */
        ),
        child: Container(
         child: Row(
           children: <Widget>[
             Expanded(
               
               child: Container(
                 child: Text(title, 
                 style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600,fontSize: 22.0, color: Colors.black,),textAlign: TextAlign.center,),
               ),
             )
           ],
         ),
        )
    );
  }
}



