import 'package:flutter/material.dart';

import '../../screens/auth/login/login_screen.dart';
import '../../screens/patient_list/patient_list_screen.dart';
import '../../screens/splash/splash_screen.dart';

class CustomRoute {
  String splash = 'splash';
  String login = 'login';
  String patientList = 'patientList';
  String bottomNavBar = 'bottomNavBar';
  String forgotPassword = 'ForgotPasswordScreen';
}

Map<String, Widget Function(BuildContext)> customMainRouter =
    <String, WidgetBuilder>{
      CustomRoute().splash: (context) => SplashScreen(),
      CustomRoute().login: (context) => LoginScreen(),
      CustomRoute().patientList : (context) => PatientListScreen()
     
    };
