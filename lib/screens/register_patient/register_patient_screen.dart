import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_const/text_const.dart';
import '../../utils/color/custom_color.dart';
import '../../utils/widgets/custom_elev_btn_widget.dart';
import '../../utils/widgets/custom_horzontal_sized_box.dart';
import '../../utils/widgets/custom_icon_btn_widget.dart';
import '../../utils/widgets/custom_icon_widget.dart';
import '../../utils/widgets/custom_text_form_widget.dart';
import '../../utils/widgets/custom_text_widget.dart';
import 'compoents/add_tretment_show_dilog.dart';
import 'compoents/payment_option_widget.dart';
import 'compoents/treatment_card_widget.dart';
import 'cubit/register_cubit_cubit.dart';

class RegisterPatientScreen extends StatelessWidget {
  const RegisterPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubitCubit(context),
      child: Scaffold(
        backgroundColor: whiteColor,
        body: BlocBuilder<RegisterCubitCubit, RegisterCubitState>(
          builder: (context, state) {
            var registerCubit = context.read<RegisterCubitCubit>();
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CustomIconButtnWidget(
                        icon: Icon(Icons.arrow_back, color: blackColor),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      trailing: Stack(
                        children: [
                          CustomIconWidget(icon: Icons.notifications_none),
                          Positioned(
                            left: 13,
                            top: 3,
                            child: CircleAvatar(
                              backgroundColor: redColor,
                              radius: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomTextWidget(
                        text: register,
                        color: blackColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Divider(),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextWidget(
                        text: "$name:",
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextformWidget(hintText: enterYourFullName),
                    ),
                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextWidget(
                        text: "$whatsppNo:",
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextformWidget(
                        hintText: enterYourWhatsappNo,
                      ),
                    ),
                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextWidget(
                        text: "$address:",
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextformWidget(hintText: enterYorAddress),
                    ),
                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextWidget(
                        text: "$location:",
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
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

                            value: registerCubit.locationSelection,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_drop_down),
                            items: registerCubit.locationList.map((
                              String items,
                            ) {
                              return DropdownMenuItem(
                                value: items,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: CustomTextWidget(
                                    text: items,
                                    color: blackColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              registerCubit.locationDropDwonValue(newValue!);
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextWidget(
                        text: "$branch:",
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
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
                            value: registerCubit.branchSelection,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_drop_down),
                            items: registerCubit.branchList.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: CustomTextWidget(
                                    text: items,
                                    color: blackColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              registerCubit.branchDropDwonValue(newValue!);
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    if (registerCubit.addedTreatments.isNotEmpty)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: registerCubit.addedTreatments.length,
                        itemBuilder: (context, index) {
                          final treatment =
                              registerCubit.addedTreatments[index];
                          return TreatmentCardWidget(
                            treatmentName: treatment.treatmentName,
                            maleCount: treatment.maleCount,
                            femaleCount: treatment.femaleCount,
                            onEdit: () {
                              registerCubit.editTreatment(index);
                              addTreatmentDialog(registerCubit, context);
                            },
                            onDelete: () {
                              registerCubit.removeTreatment(index);
                            },
                          );
                        },
                      ),

                    const SizedBox(height: 10),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.95,
                        height: MediaQuery.sizeOf(context).height * 0.07,
                        child: InkWell(
                          onTap: () {
                            addTreatmentDialog(registerCubit, context);
                            //  showTreatmentDialog(context);
                            //registerCubit.addTreatment();
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8),
                            ),
                            color: const Color.fromARGB(255, 137, 207, 139),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomIconWidget(
                                  icon: Icons.add,
                                  size: 15,
                                  color: blackColor,
                                ),
                                CustomTextWidget(
                                  text: addTreatments,
                                  color: blackColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextWidget(
                        text: "$totalAmount:",
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextformWidget(hintText: enterTotalAmount),
                    ),
                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextWidget(
                        text: "$discountAmount:",
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextformWidget(
                        hintText: enterDiscountAmount,
                      ),
                    ),
                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextWidget(
                        text: "$paymentOption:",
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        PayementOptionWidget(onChanged: () {}, radioText: cash),
                        PayementOptionWidget(onChanged: () {}, radioText: card),

                        PayementOptionWidget(onChanged: () {}, radioText: upi),
                      ],
                    ),
                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextWidget(
                        text: "$advanceAmount:",
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextformWidget(hintText: enterAdvanceAmount),
                    ),
                    SizedBox(height: 10),
                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextWidget(
                        text: "$balanceAmount:",
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextformWidget(hintText: enterBalanceAmount),
                    ),
                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextWidget(
                        text: "$treatmentDate:",
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextformWidget(
                        suffixIcon: CustomIconButtnWidget(
                          onPressed: () {},
                          icon: Icon(
                            Icons.calendar_month,
                            color: loginButnColor,
                          ),
                        ),
                        hintText: selectTreatmentDate,
                      ),
                    ),
                    SizedBox(height: 10),

                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextWidget(
                        text: "$treatmentTime:",
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    Row(
                      children: [
                        CustomHorzontalSizedBoxWidget(width: 15),
                        Expanded(
                          flex: 1,
                          child: CustomTextformWidget(
                            suffixIcon: CustomIconButtnWidget(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: loginButnColor,
                              ),
                            ),
                            hintText: hour,
                          ),
                        ),
                        CustomHorzontalSizedBoxWidget(width: 10),

                        Expanded(
                          flex: 1,
                          child: CustomTextformWidget(
                            suffixIcon: CustomIconButtnWidget(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: loginButnColor,
                              ),
                            ),
                            hintText: mintutes,
                          ),
                        ),
                        CustomHorzontalSizedBoxWidget(width: 15),
                      ],
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        child: CustomElevButtnWidget(
                          backgroundColor: loginButnColor,
                          onPressed: () {},
                          child: CustomTextWidget(
                            text: save,
                            color: whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
