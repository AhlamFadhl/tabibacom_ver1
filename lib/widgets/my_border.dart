import 'package:flutter/material.dart';

class MyBorder extends StatelessWidget {
  final Widget child;
  final padding;
  final margin;
  final color;
  final colorBorder;
  final width;
  final double? height;
  final double radius;
  const MyBorder(
      {required this.child,
      this.width,
      this.height,
      this.padding,
      this.margin,
      this.radius = 20.0,
      this.color = Colors.white,
      this.colorBorder = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      margin: margin ?? const EdgeInsets.all(0),
      padding: padding ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 1,
                offset: Offset(0, 0),
                spreadRadius: 0),
          ]),
      child: child,
    );
  }
}
