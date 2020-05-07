import 'package:flutter/material.dart';
import 'package:winncar/ui/helpers/constants.dart';


class FadeIntroWidget extends StatefulWidget {
  _FadeIntroWidgetState createState() => _FadeIntroWidgetState();
}

class _FadeIntroWidgetState extends State<FadeIntroWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  bool fade = true;

  initState() {
    super.initState();
    changeOpacity();
    controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  Widget crossFade(Widget first, Widget second, bool fade) {
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 300),
      firstChild: first,
      secondChild: second,
      crossFadeState:
          fade ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      //firstCurve: const Interval(0.0, 0.6, curve: Curves.bounceIn),
      //secondCurve: const Interval(0.4, 1.0, curve: Curves.bounceIn),
      //sizeCurve: Curves.bounceIn,
    );
  }

  Future changeOpacity(){
    final resp = Future.delayed(Duration(seconds: 5), () {
      //_dataLoader();
      _opacity();

    });

    return resp;
  }

  void _opacity(){
    setState(() {
        fade = !fade;
        changeOpacity();
    });
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[customSecondaryColor, customPrimaryColor])),
        child: crossFade(
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/intro1.jpg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/intro.jpg'),
                    fit: BoxFit.cover)),
          ),
        fade,
        )
      );
  }
}
