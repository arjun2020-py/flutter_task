import 'package:flutter/material.dart';

class CustomElevButtnWidget extends StatelessWidget {
  CustomElevButtnWidget({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.buttnRadius
  });
  final void Function()? onPressed;
  final Widget child;
  Color? backgroundColor;
  double? buttnRadius;
  @override
  
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttnRadius ?? 10)),
      ),
      child: child,
    );
  }
}
