
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibacom_ver1/shared/styles/colors.dart';
import 'package:tabibacom_ver1/widgets/sized_box.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField(
      {super.key,
      required this.controller,
      required this.validator,
      required this.placeHolder,
      this.suffexIcon,
      this.prefexIcon,
      this.obscure = false,
      this.keyboardType = TextInputType.text,
      this.enabled = true,
      this.textDirection = TextDirection.rtl,
      this.placeholderDirection = TextDirection.rtl,
      this.suffexIconFunction,
      this.maxLines,
      this.backgroundColor=Colors.white,
     this.onChanged,});
  final String placeHolder;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? suffexIcon;
  final Widget? prefexIcon;
  final bool obscure;
  final TextInputType keyboardType;
  final bool enabled;
  final TextDirection textDirection;
  final void Function()? suffexIconFunction;
  final TextDirection placeholderDirection;
  final int? maxLines;
  final Color backgroundColor;
  final ValueChanged<String>? onChanged;

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        // decoration: BoxDecoration(
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.grey.withValues(alpha: 0.4),
        //       blurRadius: 5,
        //       offset: const Offset(0, 0),
        //       spreadRadius: 0,
        //       blurStyle: BlurStyle.normal,
        //     )
        //   ],
        // ),
        child: TextFormField(
          textDirection: widget.textDirection,
          controller: widget.controller,
          cursorColor: primaryColor,
          style: const TextStyle(
            color: Colors.black,
          ),
onChanged: widget.onChanged,
          enabled: widget.enabled,
          obscureText: widget.obscure ? !showPassword : false,
          // obscureText: widget.obscure ? !showPassword : false,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            // isCollapsed: true,
            // contentPadding: EdgeInsets.symmetric(
            //   vertical: 8,
            //   horizontal: 8,
            // ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.withValues(alpha:  0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: primaryColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
               borderSide: BorderSide(color: Colors.grey.withValues(alpha:  0.3)),
            
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
            filled: true,
            fillColor: widget.backgroundColor,
               // ? Colors.white
               // :Colors.grey[100],
                // const Color.fromARGB(255, 223, 223, 223),
            // label: Text(
            //   widget.placeHolder,
            //   style: TextStyle(
            //     color: const Color(0xff1F1F1F).withValues(alpha: 0.4),
            //     fontSize: 12,
            //   ),
            //   textDirection: widget.placeholderDirection,
            // ),
            // labelText: widget.placeHolder,
            hintText: widget.placeHolder,
            hintStyle: TextStyle(
                color: const Color(0xff1F1F1F).withValues(alpha: 0.4),
                fontSize: 14.r,
                fontWeight: FontWeight.bold),
            hintTextDirection: widget.placeholderDirection,

            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: widget.suffexIcon != null
                ? IconButton(
                    padding: const EdgeInsets.all(8),
                    onPressed: () {
                      if (widget.obscure) {
                        showPassword = !showPassword;
                        setState(() {});
                      } else {
                        widget.suffexIconFunction;
                      }
                    },
                    icon: widget.suffexIcon!)
                : null,
            prefixIcon: widget.prefexIcon,
          ),

          maxLines: widget.maxLines,
        ),
      ),
    );
  }
}

class MyTextFormFieldWithLabel extends StatelessWidget {
  const MyTextFormFieldWithLabel(
      {super.key,
      required this.controller,
      required this.validator,
      this.placeHolder = 'فارغ',
      required this.label,
      this.suffexIcon,
      this.prefexIcon,
      this.obscure = false,
      this.keyboardType = TextInputType.text,
      this.mandatory = false,
      this.enabled = true,
      this.textDirection = TextDirection.rtl,
      this.suffexIconFunction,
      this.maxLines,this.backgroundColor=Colors.white,this.smallLabel});
  final String label;
  final String placeHolder;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? suffexIcon;
  final Widget? prefexIcon;
  final bool obscure;
  final TextInputType keyboardType;
  final bool mandatory;
  final bool enabled;
  final TextDirection textDirection;
  final void Function()? suffexIconFunction;
  final int? maxLines;
  final Color backgroundColor;
  final String? smallLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mandatory ? '$label *' : label,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              if(smallLabel!=null) Text(smallLabel??'', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                textAlign: TextAlign.start,),
            ],
          ),
        ),
        const CustomSizedBox(
          height: 12,
        ),
        MyTextFormField(
          controller: controller,
          placeHolder: placeHolder,
          validator: validator,
          suffexIcon: suffexIcon,
          prefexIcon: prefexIcon,
          keyboardType: keyboardType,
          obscure: obscure,
          enabled: enabled,
          maxLines: maxLines,
          backgroundColor: backgroundColor,
        ),
      ],
    );
  }
}
