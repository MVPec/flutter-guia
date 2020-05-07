
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:winncar/ui/views/home_view.dart';
import 'package:winncar/ui/views/intro_view.dart';
import 'package:winncar/ui/views/login_view.dart';
import 'package:winncar/ui/views/private_view.dart';
import 'package:winncar/ui/views/reset_password_view.dart';
import 'package:winncar/ui/views/signup_view.dart';
import 'package:winncar/ui/views/splash_view.dart';






class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch (settings.name){
      case '/' :
        return MaterialPageRoute(
          builder: (_) => IntroView()
        );
      case '/login' :
        return MaterialPageRoute(
          builder: (_) => LoginView()
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => SignUpView()
        );
      case '/private':
        return MaterialPageRoute(
          builder: (_) => PrivateView()
      );
      case '/splash':
        return MaterialPageRoute(
          builder: (_) => SplashView()
      );
      case '/reset':
        return MaterialPageRoute(
          builder: (_) => ResetPasswordView()
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => HomeView()
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}')
            ),
          )
        );
    }

  }
}