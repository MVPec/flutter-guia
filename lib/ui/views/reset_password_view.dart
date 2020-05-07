import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';
import 'package:winncar/core/view_model/login_model.dart';
import 'package:winncar/ui/helpers/constants.dart';



import '../helpers/responsive.dart';
import '../helpers/constants.dart';
import '../widgets/buttom_primary.dart';
import '../widgets/text_form_field_widget.dart';
import '../widgets/clipPath_widget.dart';

class ResetPasswordView extends StatefulWidget {
  ResetPasswordView({Key key}) : super(key: key);

  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  //String _email, _password;
  TextEditingController _email;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              height: responsive.hp(4),
            ),
            ButtomPrimary(
              width: responsive.wp(60),
              colorBorder: customPrimaryColor.withOpacity(0.3),
              nameButtom: 'REGÍSTRATE',
              text: _email.text.trim().isNotEmpty && login.getEmailController == null && login.getNameController == null ? Colors.white : customPrimaryColor.withOpacity(0.3),
              color: customPrimaryColor,
              route: _email.text.trim().isNotEmpty &&  login.getEmailController == null && login.getNameController == null ? () => _submit() : null,
            )
          ],
        ),
      );
    }



    Widget rect() {
      return ClipPath(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only( top: 20, left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              loginForm(),
              SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
        clipper: CustomClipPath(),
      );
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      
      //resizeToAvoidBottomInset: true,
      body: Container(
        height: size.height,
        width: size.width,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: customSecondaryColor,
                    size: responsive.ip(3.5),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/login')),
              expandedHeight: responsive.hp(20),
              floating: true,
              pinned: true,
              snap: true,
              elevation: 1,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('Recupera tu contraseña',
                    style: TextStyle(
                      color: customSecondaryColor,
                      fontSize: 16.0,
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
              child: Container(
                color: customPrimaryColor,
                child: rect()
              ),
            ),
          ],
        ),
      ),
    );
  }

  _submit(){
    
    Navigator.pushNamed(context, '/private');
  }
}
