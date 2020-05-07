import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';

import 'package:winncar/core/view_model/login_model.dart';

import '../helpers/constants.dart';
import '../widgets/buttom_primary.dart';
import '../widgets/clipPath_widget.dart';
import '../widgets/text_form_field_widget.dart';
import '../helpers/responsive.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  //String _email, _password;
  TextEditingController _email;
  TextEditingController _password;
  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }


 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final responsive = Responsive(context);

    Widget txt(
        String content, double fontSZ, TextDecoration decoration, weight) {
      return Text(
        content,
        style: TextStyle(
          decoration: decoration,
          fontSize: fontSZ,
          fontWeight: weight,
          color: customSecondaryColor,
        ),
      );
    }

    Widget btnEmail(String nameBtn, Function route) {
      return InkWell(
        onTap: route,
        child: Text(
          nameBtn,
          style: TextStyle(color: customSecondaryColor, fontSize: responsive.ip(2)),
        ),
      );
    }

    Widget loginForm() {
      final login = Provider.of<LoginViewModel>(context);
      return Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
                  //decoration: InputDecoration(labelText: 'Email'),
                  decoration: decorationField('Correo electrónico', _email.text.isEmpty ? null : login.getEmailController,
                      Icon(LineAwesomeIcons.envelope, size: 30.0)),
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  //validator: Validator.validateEmail,
                  onSaved: (value) => _email,
                  onChanged: (changed) => login.setEmailController(changed),
                  //autofocus: true,
                  
                  
                ),
            SizedBox(
              height: responsive.hp(2.5),
            ),
            TextFormField(
                  decoration: decorationFieldPassword(
                    'Contraseña',
                    _password.text.isEmpty ? null : login.getPasswordController,
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      child: Icon(
                        _passwordVisible
                            ? LineAwesomeIcons.eye_slash
                            : LineAwesomeIcons.eye,
                        size: 30.0,
                      ),
                    ),
                    Icon(
                      LineAwesomeIcons.lock,
                      size: 30.0,
                    ),
                  ),
                  onChanged: (change) => login.setPasswordController(change),
                  controller: _password,
                  keyboardType: TextInputType.text,
                  //validator: Validator.validatePassword,
                  obscureText: _passwordVisible,
            ),
            SizedBox(
              height: responsive.hp(4),
            ),
            ButtomPrimary(
              width: responsive.wp(60),
              colorBorder: customPrimaryColor.withOpacity(0.3),
              nameButtom: 'INICIAR SESIÓN',
              text: _email.text.trim().isNotEmpty && _password.text.trim().isNotEmpty && login.getEmailController == null && login.getPasswordController == null ? Colors.white : customPrimaryColor.withOpacity(0.3),
              color: customPrimaryColor,
              route: _email.text.trim().isNotEmpty &&  _password.text.trim().isNotEmpty && login.getEmailController == null && login.getPasswordController == null ? () => _submit() : null,
            )
          ],
        ),
      );
    }

    Widget contentForm() {
      return Container(
        padding: EdgeInsets.only(left: responsive.wp(5), right: responsive.wp(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            loginForm(),
            SizedBox(
              height: responsive.hp(4),
            ),
            SizedBox(
              height: responsive.hp(4),
            ),
            ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    btnEmail('Recuperar contraseña',
                        () => Navigator.pushNamed(context, '/reset')),
                    SizedBox(
                        width: responsive.wp(0.2),
                        child: Container(
                          height: responsive.hp(2),
                          //width: 5,
                          color: customSecondaryColor,
                        )),
                    btnEmail('Regístrarse',
                        () => Navigator.pushNamed(context, '/signup')),
                  ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: size.height,
        width: size.width,
        color: customPrimaryColor,
        child: ClipPath(
          child: Container(
            color: Colors.white,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  leading: IconButton(
                      icon: Icon(
                        LineAwesomeIcons.close,
                        color: customSecondaryColor,
                        size: responsive.ip(3.5),
                      ),
                      onPressed: () => Navigator.pop(context)),
                  expandedHeight: responsive.hp(20),
                  floating: true,
                  pinned: true,
                  snap: true,
                  elevation: 1,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text('Iniciar sesión',
                        style: TextStyle(
                          color: customSecondaryColor,
                          fontSize: responsive.ip(2),
                        )),
                    /* background: Stack(
                        children: <Widget>[
                          Image.asset(
                            'assets/img/header.jpg',
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    tileMode: TileMode.clamp,
                                    colors: <Color>[
                                  customPrimaryColor.withOpacity(0.7),
                                  customSecondaryColor.withOpacity(0.7),
                                ])),
                          ),
                        ],
                      ) */
                  ),
                ),
                SliverFillRemaining(
                  fillOverscroll: true,
                  hasScrollBody: true,
                  child: contentForm(),
                ),
              ],
            ),
          ),
          clipper: CustomClipPath(),
        ),
      ),
    );
  }


  _submit(){
    final login = Provider.of<LoginViewModel>(context);
    return print(login.getValor);
  }


   

}
