import 'package:flutter/material.dart';

import '../../../utils/color/custom_color.dart';
import '../../../utils/widgets/custom_horzontal_sized_box.dart';
import '../../../utils/widgets/custom_icon_btn_widget.dart';
import '../../../utils/widgets/custom_text_widget.dart';

class AddPatientWidget extends StatelessWidget {
  AddPatientWidget({
    super.key,
    required this.text,
    this.decrmentonPressed,
    this.incrementonPressed,
  });
  final String text;
  void Function()? decrmentonPressed;
  void Function()? incrementonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.25,
          height: MediaQuery.sizeOf(context).height * 0.05,

          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
            color: Color(0xffd9d9d9),
            child: Center(
              child: CustomTextWidget(
                text: text,
                color: blackColor,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        CustomHorzontalSizedBoxWidget(width: 5),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: loginButnColor,
          ),
          child: CustomIconButtnWidget(
            icon: Icon(Icons.remove, color: whiteColor),
            onPressed: decrmentonPressed,
          ),
        ),
        CustomHorzontalSizedBoxWidget(width: 4),

        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.14,
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: greyColor.withOpacity(0.2),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: whiteColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: whiteColor),

                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: whiteColor),

                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        CustomHorzontalSizedBoxWidget(width: 4),

        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: loginButnColor,
          ),
          child: CustomIconButtnWidget(
            icon: Center(child: Icon(Icons.add, color: whiteColor)),
            onPressed: incrementonPressed,
          ),
        ),
      ],
    );
  }
}
