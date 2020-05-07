import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:winncar/ui/widgets/fade_intro_widget.dart';

import '../helpers/constants.dart';
import '../helpers/logo.dart';
import '../helpers/responsive.dart';

class IntroView extends StatefulWidget {
  IntroView({Key key}) : super(key: key);

  _IntroViewState createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    final size = MediaQuery.of(context).size;
    final responsive = Responsive(context);


    Widget gradiente() {
      return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.clamp,
                colors: <Color>[
              customSecondaryColor.withAlpha(200),
              customPrimaryColor.withAlpha(200),
            ])),
      );
    }

    Widget txt(String text, double size, FontWeight font) {
      return Text(
        text,
        style: TextStyle(fontSize: size, color: Colors.white, fontWeight: font),
        textAlign: TextAlign.left,
      );
    }

    Widget btnSocial(String name, Color color, Color borderColor, Icon icon,
        Color colorText, Function route) {
      return Container(
        width: responsive.wp(100),
        height: responsive.hp(8),
        child: MaterialButton(
            elevation: 1.0,
            color: color,
            shape: OutlineInputBorder(
              borderSide:
                  BorderSide(color: borderColor, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: responsive.hp(8),
            onPressed: route,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                icon,
                SizedBox(
                  width: responsive.wp(2),
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: colorText,
                      fontSize: responsive.ip(2.5),
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
      );
    }

    Widget text(String text, double size) {
      return Container(
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: size),
          ),
        ),
      );
    }

    Widget btnEmail(String nameBtn, Function route) {
      return InkWell(
        onTap: route,
        child: Text(
          nameBtn,
          style: TextStyle(color: Colors.white, fontSize: responsive.ip(2)),
        ),
      );
    }

    final containerContent = SingleChildScrollView(
      child: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            logoWhite(Image.asset('assets/img/logo_white.png'), responsive.wp(50)),
            SizedBox(
              height: responsive.hp(4),
            ),
            Align(
              child: txt('Regístrate ahora.', responsive.ip(2.5), FontWeight.bold),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(
              height: responsive.hp(2),
            ),
            txt('Crea tu cuenta en tan solo unos segundo y reserva un taller mecánico muy cerca de ti.',
                responsive.ip(2), FontWeight.w600),
            SizedBox(
              height: responsive.hp(3),
            ),
            btnSocial(
                'Facebook',
                colorFacebook,
                colorFacebook,
                Icon(
                  FontAwesomeIcons.facebookF,
                  size: responsive.ip(2),
                  color: Colors.white,
                ),
                Colors.white,
                () => Navigator.pushNamed(context, '/private')),
            SizedBox(
              height: responsive.hp(2),
            ),
            btnSocial(
                'Google',
                colorGoogle,
                colorGoogle,
                Icon(LineAwesomeIcons.google,
                    color: Colors.white,
                    size: responsive.ip(3)),
                Colors.white,
                () => Navigator.pushNamed(context, '/private')),
            SizedBox(
              height: responsive.hp(4),
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.end,s
              children: <Widget>[
                text('Continua con tu correo electrónico:', responsive.ip(2)),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    btnEmail('Iniciar sesión',
                        () => Navigator.pushNamed(context, '/login')),
                    SizedBox(
                        width: responsive.wp(0.2),
                        child: Container(
                          height: responsive.hp(2),
                          //width: 5,
                          color: Colors.white,
                        )),
                    btnEmail('Regístrate',
                        () => Navigator.pushNamed(context, '/signup')),
                  ],
                )
              ],
            ),
            SizedBox(
              height: responsive.hp(4),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>
                    [
                      TextSpan(
                          text: "Continuar implica que has leído y aceptado los ",
                          style: defaultStyleTC(responsive.ip(1.8))),
                      TextSpan(
                          text: 'Términos y condiciones',
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              launch('https://www.google.com');
                            },
                          style: defaultStyleTC(responsive.ip(1.8)).copyWith(
                              decoration: TextDecoration.underline,
                              color: Colors.white70)),
                      TextSpan(
                          text: " y ",
                          style: defaultStyleTC(responsive.ip(1.8))),
                      TextSpan(
                          text: 'Política de privacidad',
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              launch('https://www.google.com');
                            },
                          style: defaultStyleTC(responsive.ip(1.8)).copyWith(
                              decoration: TextDecoration.underline,
                              color: Colors.white70)),
                    ],
              ),
            ),
          ],
        ),
      ),
    );
    

    return Scaffold(
      body: Stack(
        children: <Widget>[
          FadeIntroWidget(),
          gradiente(),
          containerContent

          /*Positioned(bottom: 30.0, child: button('Inngresar', () => Navigator.pushNamed(context, '/'), customPrimaryColor),),
         Positioned(bottom: 30.0, right: 0.0, child: button('Registrarse', () => Navigator.pushNamed(context, '/register'), customSecondaryColor),), */
        ],
      ),
    );
    /* Scaffold(
      body: Stack(
        children: <Widget>[
          fondo2,
          Positioned(top: 35.0, left: 0, right: 0, child: logo,),
          Positioned(bottom: 20.0, child: btnLogin,),
          Positioned(bottom: 20.0, right: 0.0, child: btnRegister,),

        ],
      ),
    ); */

    /* return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: new Image.asset(
              'assets/images/intro.jpg',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Text("This is a Text",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    color: Colors.white)),
          ),
        ],
      ),
    ); */
  }
}
