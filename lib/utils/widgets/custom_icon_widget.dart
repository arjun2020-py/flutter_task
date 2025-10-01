import 'package:flutter/material.dart';

class CustomIconWidget extends StatelessWidget {
   CustomIconWidget({super.key,required this.icon,this.color,this.size});
  final IconData icon;
  Color? color;
  double? size;
  @override
  Widget build(BuildContext context) {
    return Icon(icon,color:color,size:size,);
  }
}
