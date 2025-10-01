import 'package:flutter/material.dart';

class CustomIconButtnWidget extends StatelessWidget {
  const CustomIconButtnWidget({super.key, required this.onPressed,required this.icon});
  final void Function()? onPressed;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: icon);
  }
}
