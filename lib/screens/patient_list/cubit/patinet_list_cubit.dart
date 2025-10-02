import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/helper/custom_navigtion.dart';
import '../../../utils/router/navigtion_router.dart';

part 'patinet_list_state.dart';

class PatinetListCubit extends Cubit<PatinetListState> {
  PatinetListCubit(this.context) : super(PatinetListInitial());
  BuildContext context;
  onRegister() async {
    NavigtionService().pushName(CustomRoute().register);
  }
}
