import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/view/home_screen.dart';
import 'package:flutter_mvvm_provider/view/login_view.dart';
import 'package:flutter_mvvm_provider/view/signup_screen.dart';
import 'package:flutter_mvvm_provider/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashView());

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text("No Route Defined"),
                  ),
                ));
    }
  }
}
