import 'package:flutter/material.dart';

class MyBorder extends StatelessWidget {
  final Widget child;
  final padding;
  final margin;
  final color;
    final colorBorder;
 final width;
  const MyBorder(
      {required this.child,
       this.width,
      this.padding,
      this.margin,
      this.color = Colors.white,this.colorBorder=Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      margin: margin ?? const EdgeInsets.all(0),
      padding: padding ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorBorder),
      ),
      child: child,
    );
  }
}
