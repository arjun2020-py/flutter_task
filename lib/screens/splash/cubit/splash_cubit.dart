import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/helper/custom_navigtion.dart';
import '../../../utils/local_storage/local_storage.dart';
import '../../../utils/router/navigtion_router.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.context) : super(SplashInitial()) {
    onSplash();
  }
  BuildContext context;
  onSplash() async {
    var token = await LocalStroage().getToken();
    debugPrint('-------token is $token -----');
    if (token == null) {
      Future.delayed(Duration(seconds: 3), () {
        NavigtionService().pushName(CustomRoute().login);
      });
    } else {
       Future.delayed(Duration(seconds: 3), () {
        NavigtionService().pushName(CustomRoute().patientList);
      });
    }
  }
}
