import 'package:flutter/material.dart';

class CustomVerticalSizedBoxWidget extends StatelessWidget {
  const CustomVerticalSizedBoxWidget({super.key,required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height,
    );
  }
}
