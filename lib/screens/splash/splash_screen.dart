import 'package:flutter/material.dart';

import '../../utils/app_const/image_const.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Image.asset(
        appSplashPic,
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height,
      ),
    );
  }
}
