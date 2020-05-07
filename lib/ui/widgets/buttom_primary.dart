import 'package:flutter/material.dart';
import 'package:winncar/ui/helpers/responsive.dart';



class ButtomPrimary extends StatelessWidget {

  final double width;
  final Color colorBorder;
  final String nameButtom;
  final Color text;
  final Color color;
  final dynamic route;

  const ButtomPrimary({Key key, this.width, this.colorBorder, this.nameButtom, this.text, this.color, this.route}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    final responsive = Responsive(context);
    return Container(
    width: width,
    height: responsive.hp(8),
    child: MaterialButton(
      shape: OutlineInputBorder(
        borderSide: BorderSide(color: colorBorder, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      color: color,
      height: responsive.hp(8),
      elevation: 1,
      onPressed: route,
      child: Text(
        nameButtom,
        style:
            TextStyle(color: text, fontSize: responsive.ip(2), fontWeight: FontWeight.bold),
      ),
    ),
  );
  }
}

