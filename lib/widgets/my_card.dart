import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final padding;
  final margin;
  final color;
  final double raduis;
  final width;


  const MyCard({
    required this.child,
    this.padding,
    this.margin,
    this.color = Colors.white,
    this.raduis = 16,
    this.width,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
    //  alignment: Alignment.center,
      width: width,
      margin: margin ?? const EdgeInsets.all(0),
      padding: padding ?? const EdgeInsets.all(0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(raduis)),
        boxShadow: [
          BoxShadow(
              offset: Offset(1, 2),
              blurRadius: 5,
              spreadRadius: 1,
              color: Colors.grey.shade200)
     
        ],
      ),
      child: child,
    );
  }
}
