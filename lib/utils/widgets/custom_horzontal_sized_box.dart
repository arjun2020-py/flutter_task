import 'package:flutter/material.dart';

class CustomHorzontalSizedBoxWidget extends StatelessWidget {
  const CustomHorzontalSizedBoxWidget({super.key,required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width:width,);
  }
}
