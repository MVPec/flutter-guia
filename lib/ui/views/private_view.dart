import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:winncar/ui/helpers/constants.dart';
import 'package:winncar/ui/helpers/responsive.dart';
import 'package:winncar/ui/widgets/buttom_primary.dart';
import 'package:winncar/ui/widgets/clipPath_widget.dart';

class PrivateView extends StatefulWidget {
  PrivateView({Key key}) : super(key: key);

  _PrivateViewState createState() => _PrivateViewState();
}

class _PrivateViewState extends State<PrivateView> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final responsive = Responsive(context);

    Widget rect() {
      return ClipPath(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: responsive.wp(5), right: responsive.wp(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
              'Términos y Condiciones y Privacidad',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: responsive.ip(3), fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: responsive.hp(4),
              ),
              Text(
                'Usamos datos de clientes para mejorar la experiencia de nuestro servicio y mostrar promociones relacionadas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: responsive.ip(2),
                  color: customPrimaryColor
                ),
              ),
              SizedBox(
                height: responsive.hp(5),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: "Continuar implica que has leído y aceptado los ",
                        style:  styleTextLink(responsive.ip(2), customPrimaryColor)),
                    TextSpan(
                        text: 'Términos y condiciones',
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            launch('https://www.google.com');
                          },
                        style:  styleTextLink(responsive.ip(1.8), customSecondaryColor).copyWith(
                            decoration: TextDecoration.underline,
                            color: customPrimaryColor)),
                    TextSpan(text: ", ", style: styleTextLink(responsive.ip(1.8), customPrimaryColor)),
                    TextSpan(
                        text: 'Política de privacidad de datos',
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            launch('https://www.google.com');
                          },
                        style: styleTextLink(responsive.ip(1.8), customSecondaryColor).copyWith(
                            decoration: TextDecoration.underline,
                            color: customPrimaryColor)),
                    TextSpan(text: " y ", style: styleTextLink(responsive.ip(1.8), customPrimaryColor)),
                    TextSpan(
                        text: 'Política de cookies.',
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            launch('https://www.google.com');
                          },
                        style: styleTextLink(responsive.ip(1.8), customSecondaryColor).copyWith(
                            decoration: TextDecoration.underline,
                            color: customPrimaryColor)),
                  ],
                ),
              ),
              SizedBox(
                height: responsive.hp(5),
              ),
              ButtomPrimary(
                  width: responsive.wp(80),
                  colorBorder: customPrimaryColor,
                  nameButtom: 'CONTINUAR Y REGISTRARSE',
                  text: Colors.white,
                  color: customPrimaryColor,
                  route: () => print('ruta'))
            ],
          ),
        ),
        clipper: CustomClipPath(),
      );
    }

    return Scaffold(
      body: Container(
          height: size.height,
          width: size.width,
          color: customPrimaryColor,
          child: rect()),
    );
  }
}
