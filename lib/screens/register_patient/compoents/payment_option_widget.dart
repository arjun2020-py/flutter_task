import 'package:flutter/material.dart';

import '../../../utils/color/custom_color.dart';
import '../../../utils/widgets/custom_text_widget.dart';

class PayementOptionWidget extends StatelessWidget {
  const PayementOptionWidget({super.key, required this.onChanged,required this.radioText});
  final void Function() onChanged;
  final String radioText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RadioGroup(onChanged: (value) {}, child: Radio(value: 0)),
        CustomTextWidget(text: radioText, color: blackColor),
      ],
    );
  }
}
