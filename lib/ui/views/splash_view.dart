import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:winncar/ui/helpers/constants.dart';

class SplashView extends StatefulWidget {
  SplashView({Key key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
 void initState() { 
   super.initState();
   Timer(Duration(seconds: 5), () => Navigator.pushNamed(context, '/'));
 }

 @override
  Widget build(BuildContext context) {
    return  Center(
        child: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              colors: <Color>[
            customPrimaryColor,
            customSecondaryColor,
          ])),
          child: FlareActor('assets/flare/splash.flr', animation: 'animation',),
        ),
      );
  }
}