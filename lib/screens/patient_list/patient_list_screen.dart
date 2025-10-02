import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/screens/patient_list/cubit/patinet_list_cubit.dart';

import '../../utils/app_const/text_const.dart';
import '../../utils/color/custom_color.dart';
import '../../utils/widgets/custom_elev_btn_widget.dart';
import '../../utils/widgets/custom_horzontal_sized_box.dart';
import '../../utils/widgets/custom_icon_btn_widget.dart';
import '../../utils/widgets/custom_icon_widget.dart';
import '../../utils/widgets/custom_text_form_widget.dart';
import '../../utils/widgets/custom_text_widget.dart';
import 'compoents/patinet_list_card_widget.dart';

class PatientListScreen extends StatelessWidget {
  const PatientListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatinetListCubit(context),
      child: BlocBuilder<PatinetListCubit, PatinetListState>(
        builder: (context, state) {
          var cubit = context.read<PatinetListCubit>();
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.9,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
                backgroundColor: loginButnColor,
                onPressed: () {
                  cubit.onRegister();
                },
                child: CustomTextWidget(text: registerNow, color: whiteColor),
              ),
            ),
            backgroundColor: whiteColor,
            body: BlocBuilder<PatinetListCubit, PatinetListState>(
              builder: (context, state) {
                return SafeArea(
                  child: Column(
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
                      Row(
                        children: [
                          CustomHorzontalSizedBoxWidget(width: 10),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: CustomTextformWidget(
                                prefixIcon: Icon(Icons.search),
                                hintText: searchForTreatments,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 90, // Add a specific width
                            child: CustomElevButtnWidget(
                              buttnRadius: 8,
                              backgroundColor: loginButnColor,
                              onPressed: () {},
                              child: CustomTextWidget(
                                text: serach,
                                color: whiteColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          CustomHorzontalSizedBoxWidget(width: 15),
                        ],
                      ),
                      SizedBox(height: 10),

                      Row(
                        children: [
                          CustomHorzontalSizedBoxWidget(width: 10),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: CustomTextWidget(
                              text: sortBy,
                              color: blackColor,
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).width * 0.15,
                            width: MediaQuery.sizeOf(context).width * 0.45,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(20),
                              ),
                              color: whiteColor,
                              child: Row(
                                children: [
                                  CustomHorzontalSizedBoxWidget(width: 10),

                                  CustomTextWidget(
                                    text: date,
                                    color: blackColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {},
                                    child: CustomIconWidget(
                                      icon: Icons.arrow_drop_down,
                                      color: blackColor,
                                    ),
                                  ),
                                  CustomHorzontalSizedBoxWidget(width: 10),
                                ],
                              ),
                            ),
                          ),
                          CustomHorzontalSizedBoxWidget(width: 10),
                        ],
                      ),
                      Divider(),
                      BlocBuilder<PatinetListCubit, PatinetListState>(
                        buildWhen: (previous, current) =>
                            current is PatientListData,
                        builder: (context, state) {
                          if (state is PatientListData) {
                            return Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return PatinetListCardWidget(patientListData: state,index: index,);
                                },
                              ),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator(),);
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
