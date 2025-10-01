import 'package:flutter/material.dart';

import '../../../utils/app_const/image_const.dart';
import '../../../utils/app_const/text_const.dart';
import '../../../utils/color/custom_color.dart';
import '../../../utils/widgets/custom_elev_btn_widget.dart';
import '../../../utils/widgets/custom_text_form_widget.dart';
import '../../../utils/widgets/custom_text_widget.dart';
import '../../../utils/widgets/custom_vertical_sized_box.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(appLoginFaremePic),
                Positioned(
                  bottom: 50,
                  left: 50,
                  right: 50,
                  top: 50,
                  child: Image.asset(appLogo),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomTextWidget(
                text: loginText,
                color: blackColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomTextWidget(
                text: "$email:",
                color: blackColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomTextformWidget(hintText: enterYourEmail),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomTextWidget(
                text: "$password:",
                color: blackColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomTextformWidget(hintText: enterPassword),
            ),
            SizedBox(height: 70),

            Center(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: CustomElevButtnWidget(
                  backgroundColor: loginButnColor,
                  onPressed: () {},
                  child: CustomTextWidget(text: login, color: whiteColor),
                ),
              ),
            ),
            SizedBox(height: 140),

            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: blackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                  text: loginText1,
                  children: [
                    TextSpan(
                      text: loginText2,
                      style: TextStyle(
                        color: loginPrivacyColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: loginText3,
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: loginText4,
                      style: TextStyle(
                        color: loginPrivacyColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
