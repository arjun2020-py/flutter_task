import 'package:flutter/material.dart';

import '../../../utils/app_const/text_const.dart';
import '../../../utils/color/custom_color.dart';
import '../../../utils/widgets/custom_horzontal_sized_box.dart';
import '../../../utils/widgets/custom_icon_btn_widget.dart'
    show CustomIconButtnWidget;
import '../../../utils/widgets/custom_icon_widget.dart';
import '../../../utils/widgets/custom_text_widget.dart';

class PatinetListCardWidget extends StatelessWidget {
  const PatinetListCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: cardColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHorzontalSizedBoxWidget(width: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: CustomTextWidget(text: '1.', color: blackColor),
                ),
                CustomHorzontalSizedBoxWidget(width: 10),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),

                    CustomTextWidget(text: 'Vikram Singh', color: blackColor),
                    SizedBox(height: 5),
                    CustomTextWidget(
                      text: 'Couple Combo Package (Rejuven...)',
                      color: loginButnColor,
                    ),
                    SizedBox(height: 5),

                    Row(
                      children: [
                        Row(
                          children: [
                            CustomIconWidget(
                              icon: Icons.calendar_month,
                              color: appIconSecondaryColor,
                              size: 13,
                            ),
                            CustomHorzontalSizedBoxWidget(width: 5),

                            CustomTextWidget(
                              text: '31/01/2024',
                              color: blackColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            ),
                          ],
                        ),
                        CustomHorzontalSizedBoxWidget(width: 20),

                        Row(
                          children: [
                            CustomIconWidget(
                              icon: Icons.supervisor_account_rounded,
                              color: appIconSecondaryColor,
                              size: 13,
                            ),
                            CustomHorzontalSizedBoxWidget(width: 5),

                            CustomTextWidget(
                              text: 'Jithesh',
                              color: blackColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),

            SizedBox(
              width:
                  MediaQuery.sizeOf(context).width *
                  1, // Adjust this width as needed
              child: const Divider(color: Colors.grey, thickness: 0.4),
            ),
            Row(
              children: [
                CustomHorzontalSizedBoxWidget(width: 30),

                CustomTextWidget(
                  text: viewBookingDetails,
                  color: blackColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                ),
                Spacer(),
                CustomIconButtnWidget(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: loginButnColor,
                    size: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
