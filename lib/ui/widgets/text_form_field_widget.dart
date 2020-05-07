import 'package:flutter/material.dart';
import 'package:winncar/ui/helpers/constants.dart';

InputDecoration decorationField(String text, String error, Icon icon) {
  return InputDecoration(
    prefixIcon: Padding(
      padding: EdgeInsets.all(0.0),
      child: icon, // icon is 48px widget.
    ),
    labelText: text,
    helperText: error,
    //errorText: error,
    border: OutlineInputBorder(), //tipo de border
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: colorBorder, width: 1), //color del border sin focus
        borderRadius: BorderRadius.all(Radius.circular(5))),
    focusedBorder: OutlineInputBorder(
      //color de border con focus
      borderSide: BorderSide(width: 1),
    ),
    errorBorder: OutlineInputBorder(
        //border del error
        borderSide: BorderSide(color: colorErrorBorder),
        borderRadius: BorderRadius.all(Radius.circular(5))),
    focusedErrorBorder: OutlineInputBorder(
        //border con focus del error
        borderSide: BorderSide(color: colorErrorBorder),
        borderRadius: BorderRadius.all(Radius.circular(5))),
  );
}


InputDecoration decorationFieldPassword(String text, String errorPass, Widget gest, Icon icon,) {
  return InputDecoration(
    prefixIcon: Padding(
      padding: EdgeInsets.all(0.0),
      child: icon// icon is 48px widget.
    ),
    labelText: text,
    helperText: errorPass,
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorBorder), //color del border sin focus
        borderRadius: BorderRadius.all(Radius.circular(5))),
    focusedBorder: OutlineInputBorder(
      //color de border con focus
      borderSide: BorderSide(width: 1),
    ),
    errorBorder: OutlineInputBorder(
        //border del error
        borderSide: BorderSide(color: colorErrorBorder),
        borderRadius: BorderRadius.all(Radius.circular(5))),
    focusedErrorBorder: OutlineInputBorder(
        //border con focus del error
        borderSide: BorderSide(color: colorErrorBorder),
        borderRadius: BorderRadius.all(Radius.circular(5))),
    suffixIcon: gest,
  );
}
