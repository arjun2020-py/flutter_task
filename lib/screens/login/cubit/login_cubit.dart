
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/helper/custom_navigtion.dart';
import '../../../utils/router/navigtion_router.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.context) : super(LoginInitial());

    BuildContext context;
  onLogin() async{
      NavigtionService().pushName(CustomRoute().patientList);
    
  }
}
