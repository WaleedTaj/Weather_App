import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer(
      {required this.widget, required this.padding, required this.margin});
  final Widget widget;
  final EdgeInsets padding;
  final EdgeInsets margin;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: width * 0.003,
          color: Colors.black87,
        ),
        borderRadius: BorderRadius.circular(14),
        color: Colors.white.withOpacity(0.55),
      ),
      margin: margin,
      padding: padding,
      child: widget,
    );
  }
}
