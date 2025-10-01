import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_const/image_const.dart';
import 'cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(context),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return Scaffold(
            body: Image.asset(
              appSplashPic,
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height,
              fit: BoxFit.cover, // Makes image cover the entire screen
            ),
          );
        },
      ),
    );
  }
}
