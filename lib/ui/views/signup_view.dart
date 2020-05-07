import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';
import 'package:winncar/core/view_model/login_model.dart';


import '../helpers/constants.dart';
import '../helpers/responsive.dart';
import '../widgets/buttom_primary.dart';
import '../widgets/clipPath_widget.dart';
import '../widgets/text_form_field_widget.dart';

class SignUpView extends StatefulWidget {
  SignUpView({Key key}) : super(key: key);

  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool monVal = false;
  bool tuVal = false;
  bool wedVal = false;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  //String _email, _password;
  TextEditingController _name;
  TextEditingController _email;
  TextEditingController _password;
  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: "");
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final responsive = Responsive(context);


     Widget loginForm() {
      final login = Provider.of<LoginViewModel>(context);
      return Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
                  //decoration: InputDecoration(labelText: 'Email'),
                  decoration: decorationField('Nombre', _name.text.isEmpty ? null : login.getNameController,
                      Icon(LineAwesomeIcons.user, size: 30.0)),
                  controller: _name,
                  keyboardType: TextInputType.emailAddress,
                  //validator: Validator.validateEmail,
                  onChanged: (changed) => login.setNameController(changed),
                  //autofocus: true,  
            ),
            SizedBox(
              height: responsive.hp(3),
            ),
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
              height: responsive.hp(3),
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
              nameButtom: 'REGÍSTRATE',
              text: _name.text.trim().isNotEmpty && _email.text.trim().isNotEmpty && _password.text.trim().isNotEmpty && login.getEmailController == null && login.getNameController == null && login.getPasswordController == null? Colors.white : customPrimaryColor.withOpacity(0.3),
              color: customPrimaryColor,
              route: _name.text.trim().isNotEmpty && _email.text.trim().isNotEmpty &&  _password.text.trim().isNotEmpty && login.getEmailController == null && login.getNameController == null && login.getPasswordController == null ? () => _submit() : null,
            )
          ],
        ),
      );
    }

    Widget rect() {
      return Container(
        color: customPrimaryColor,
        child: ClipPath(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: responsive.hp(2), left: responsive.wp(5), right: responsive.wp(5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                loginForm(),
                SizedBox(
                  height: responsive.hp(4),
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: "¿Ya tienes una cuenta? ", style: styleTextLink(responsive.ip(2), customPrimaryColor)),
                      TextSpan(
                          text: 'Iniciar sesión',
                          recognizer: new TapGestureRecognizer()
                            ..onTap =
                                () => Navigator.pushNamed(context, '/login'),
                          style: styleTextLink(responsive.ip(2), customSecondaryColor).copyWith(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              color: customSecondaryColor)),
                    ],
                  ),
                ),
                SizedBox(
                  height: responsive.hp(5),
                ),
              ],
            ),
          ),
          clipper: CustomClipPath(),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: CustomScrollView(
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
              title: Text('Regístrate',
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
            child: rect(),
          ),
        ],
      ),
    );
  }


  _submit(){
    
    Navigator.pushNamed(context, '/private');
  }
}
