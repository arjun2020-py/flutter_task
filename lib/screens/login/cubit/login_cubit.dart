import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../utils/api_url/api_const.dart';
import '../../../utils/color/custom_color.dart';
import '../../../utils/helper/custom_navigtion.dart';
import '../../../utils/local_storage/local_storage.dart';
import '../../../utils/router/navigtion_router.dart';
import '../../../utils/widgets/custom_text_widget.dart';
import '../model/login_response_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.context) : super(LoginInitial());

  BuildContext context;
  final formKey = GlobalKey<FormState>();

  TextEditingController emailCtr = TextEditingController(),
      password = TextEditingController();

  emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter vaild email';
    }
    // You can add more complex validation here, e.g., regex for email format
    return null; // Return null if the input is valid
  }

  passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter vaild password';
    }
    // You can add more complex validation here, e.g., regex for email format
    return null; // Return null if the input is valid
  }

  late GetApiResponseLoginModel getApiResponseLoginModel;

  Future<void> onLogin(BuildContext context) async {
    debugPrint('enterd email id is ${emailCtr.text}');
    debugPrint('enterd password id is ${password.text}');

    var request = http.MultipartRequest('POST', Uri.parse(baseUrl + loginUrl));

    //-------- add reqiued fileds  for  the ambulance entrollment -------
    request.fields['username'] = emailCtr.text.isNotEmpty ? emailCtr.text : '';
    request.fields['password'] = password.text.isNotEmpty ? password.text : '';

    try {
      // send the  request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        if (formKey.currentState!.validate()) {
          if (emailCtr.text == 'test_user' && password.text == '12345678') {
            var jsonData = json.decode(response.body);
            getApiResponseLoginModel = GetApiResponseLoginModel.fromJson(
              jsonData,
            );
            var userToken = getApiResponseLoginModel.token;
            LocalStroage().saveToken(userToken);
            var message = getApiResponseLoginModel.message;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: greenColor,
                content: CustomTextWidget(text: message, color: whiteColor),
              ),
            );
            NavigtionService().pushName(CustomRoute().patientList);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: redColor,
                content: CustomTextWidget(
                  text: 'Invalid username or password',
                  color: whiteColor,
                ),
              ),
            );
          }
        }
      }
    } catch (e) {
      debugPrint('error is $e');
    }
  }

  // onLogin() async {
  //   NavigtionService().pushName(CustomRoute().patientList);
  // }
}
