import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  CustomTextWidget({
    super.key,
    required this.text,
    required this.color,
    this.fontWeight,
    this.fontSize,
    this.textDecoration = TextDecoration.none,
  });
  final String text;
  final Color color;
  FontWeight? fontWeight;
  double? fontSize;
  final TextDecoration textDecoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: textDecoration,
      ),
    );
  }
}
