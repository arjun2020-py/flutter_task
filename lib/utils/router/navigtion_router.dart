import 'package:flutter/material.dart';



class CustomRoute {
  String splash = 'splash';
  String login = 'login';
  String bottomNavBar = 'bottomNavBar';
  String forgotPassword = 'ForgotPasswordScreen';
}

Map<String, Widget Function(BuildContext)> customMainRouter =
    <String, WidgetBuilder>{
      // CustomRoute().splash: (context) => SplashScreen(),
      // CustomRoute().login: (context) => LoginScreen(),
      // CustomRoute().forgotPassword : (context) => ForgotPasswordScreen(),
      // CustomRoute().bottomNavBar : (context) => BottomNavBarScreen(),
    };
