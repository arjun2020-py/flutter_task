import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/helper/custom_navigtion.dart';
import '../../../utils/router/navigtion_router.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.context) : super(SplashInitial());
  BuildContext context;
  onSplash() async {
    Future.delayed(Duration(seconds: 3), () {
      NavigtionService().pushName(CustomRoute().login);
    });
  }
}
