import 'package:flutter/material.dart';

import '../../../utils/app_const/text_const.dart';
import '../../../utils/color/custom_color.dart';
import '../../../utils/widgets/custom_elev_btn_widget.dart';
import '../../../utils/widgets/custom_text_widget.dart';
import '../cubit/register_cubit_cubit.dart';
import 'add_patient_widget.dart';

void addTreatmentDialog(RegisterCubitCubit cubit, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomTextWidget(
                  text: "$chooseTreatment:",
                  color: blackColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.07,
                  decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.2),
                    border: Border.all(color: const Color(0xffe2e2e2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      dropdownColor: whiteColor,
                      value: cubit.chooseTreatment,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      items: cubit.treatmentList.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: CustomTextWidget(
                              text: items,
                              color: blackColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        cubit.treatmentDropDwonValue(newValue!);
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              CustomTextWidget(text: addPatients, color: blackColor),

              AddPatientWidget(text: male),
              const SizedBox(height: 10),

              AddPatientWidget(text: male),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  child: CustomElevButtnWidget(
                    backgroundColor: loginButnColor,
                    onPressed: () {
                      cubit.addTreatmentToList();
                       Navigator.of(context).pop();
                    },
                    child: CustomTextWidget(text: save, color: whiteColor),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      );
    },
  );
}
