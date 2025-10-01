import 'package:flutter/material.dart';

import '../color/custom_color.dart';

// ignore: must_be_immutable
class CustomTextformWidget extends StatelessWidget {
  CustomTextformWidget({
    super.key,
    this.controller,
    this.borderRadius,
    required this.hintText,
    this.obscureText,
    this.suffixIcon,
    this.validator,
  });
  TextEditingController? controller;
  double? borderRadius;
  final String hintText;
  bool? obscureText;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: greyColor.withOpacity(0.2),
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: greyColor),
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greyColor),

          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greyColor),

          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
      ),
    );
  }
}
