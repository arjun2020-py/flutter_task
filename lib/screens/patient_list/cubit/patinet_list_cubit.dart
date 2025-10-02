import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../utils/api_url/api_const.dart';
import '../../../utils/helper/custom_navigtion.dart';
import '../../../utils/local_storage/local_storage.dart';
import '../../../utils/router/navigtion_router.dart';
import '../../register_patient/compoents/add_patient_widget.dart';
import '../model/patient_list_api_response_model.dart';

part 'patinet_list_state.dart';

class PatinetListCubit extends Cubit<PatinetListState> {
  PatinetListCubit(this.context) : super(PatinetListInitial()) {
    onGetPatientList();
  }
  BuildContext context;
   onRegister() async {
    NavigtionService().pushName(CustomRoute().register);
  }

  late GetApiResponsePatientListModel getApiResponsePatientListModel;
  onGetPatientList() async {
    var token = await LocalStroage().getToken();
    debugPrint('-----------test1');
    var response = await http.get(
      Uri.parse(baseUrl + patientList),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    try {
      debugPrint('-----------Response status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        debugPrint('-----------test3');

        var responseData = json.decode(response.body);
        getApiResponsePatientListModel =
            GetApiResponsePatientListModel.fromJson(responseData);
        emit(
          PatientListData(
            getApiResponsePatientListModel: getApiResponsePatientListModel,
          ),
        );
      }
    } catch (e) {
      debugPrint('excpection is $e');
    }
  }
}
