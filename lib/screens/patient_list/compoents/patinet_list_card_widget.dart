import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/app_const/text_const.dart';
import '../../../utils/color/custom_color.dart';
import '../../../utils/widgets/custom_horzontal_sized_box.dart';
import '../../../utils/widgets/custom_icon_btn_widget.dart'
    show CustomIconButtnWidget;
import '../../../utils/widgets/custom_icon_widget.dart';
import '../../../utils/widgets/custom_text_widget.dart';
import '../cubit/patinet_list_cubit.dart';

class PatinetListCardWidget extends StatelessWidget {
  const PatinetListCardWidget({
    super.key,
    required this.patientListData,
    required this.index,
  });
  final PatientListData patientListData;
  final int index;
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
                  child: CustomTextWidget(
                    text: '${index + 1}',
                    color: blackColor,
                  ),
                ),
                CustomHorzontalSizedBoxWidget(width: 10),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),

                    CustomTextWidget(
                      text: patientListData
                          .getApiResponsePatientListModel
                          .patient[index]
                          .name,
                      color: blackColor,
                    ),
                    SizedBox(height: 5),
                    CustomTextWidget(
                      text:
                          patientListData
                              .getApiResponsePatientListModel
                              .patient[index]
                              .patientdetailsSet[0]
                              .treatmentName ??
                          'N/A',
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
                              text:
                                  (patientListData
                                              .getApiResponsePatientListModel
                                              .patient[index]
                                              .dateNdTime !=
                                          null &&
                                      patientListData
                                          .getApiResponsePatientListModel
                                          .patient[index]
                                          .dateNdTime!
                                          .toString()
                                          .isNotEmpty)
                                  ? DateFormat('dd/MM/yyyy').format(
                                      DateTime.tryParse(
                                            patientListData
                                                .getApiResponsePatientListModel
                                                .patient[index]
                                                .dateNdTime!
                                                .toString(),
                                          ) ??
                                          DateTime(1970, 1, 1),
                                    )
                                  : 'N/A',
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
                              text: patientListData
                                  .getApiResponsePatientListModel
                                  .patient[index]
                                  .user,
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
