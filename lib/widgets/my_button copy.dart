
import 'package:flutter/material.dart';
import 'package:tabibacom_ver1/shared/styles/colors.dart';
import 'package:tabibacom_ver1/widgets/my_text.dart';


class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool loading;
  final Color? color;
  final Color textColor;
  final double padding;
  final double height;
  final double width;
  final double? widthBorder;
  final double elevation;
  final double radius;
  final double textSize;
  final FontWeight? fontWeight;
  final Widget? icon;

  const MyButton(
      {required this.title,
      required this.onTap,
      this.loading = false,
      this.color = primaryColor,
      this.fontWeight,
      this.textColor = Colors.white,
      this.width = double.infinity,
      this.widthBorder,
      this.height = 46,
      this.textSize = 16,
      this.radius = 10,
      this.elevation = 0,
      this.padding = 0,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: elevation,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
              side: widthBorder == null
                  ? BorderSide.none
                  : BorderSide(color: textColor, width: widthBorder!),
              borderRadius: BorderRadius.circular(radius)),
        ),
        onPressed: loading ? null : onTap,
        child: loading == true
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey.shade100))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    title,
                    fontSize: textSize,
                    textAlign: TextAlign.center,
                    color: textColor,
                    fontWeight: fontWeight,
                  ),
                  icon ?? Container()
                ],
              ),
      ),
    );
  }
}
