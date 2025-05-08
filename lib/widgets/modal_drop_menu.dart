import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tabibacom_ver1/shared/styles/colors.dart';
import 'package:tabibacom_ver1/widgets/my_button.dart';


// ignore: must_be_immutable
class ModalDropMenu extends StatefulWidget {
  ModalDropMenu({
    super.key,
    required this.onValueChanged,
    // required this.itemsCount,
    this.startIndex,
    this.endIndex,
    this.values,
    this.isTwoDigits = false,
    this.twoArrowsShape = true,
    // required this.value,
    this.borderRadius = const BorderRadiusDirectional.all(Radius.circular(8)),
    this.onValidate,
    this.initialValue,
    this.placeholder,
    this.showTitle = false,
    this.title = '',
    required this.selectedColor,
    this.valuesTitle,
  required  this.controller,
  this.backgroundColor=Colors.white,
    // this.width,
  }) : assert((values == null && (startIndex != null || endIndex != null)) ||
            (values != null && (startIndex == null || endIndex == null)));
  final void Function(Object)? onValueChanged;
  // final int itemsCount;
  final int? startIndex;
  final int? endIndex;
  final List<String>? values;
  final bool isTwoDigits;
  final bool twoArrowsShape;
  final BorderRadiusGeometry borderRadius;
  Future<String?> Function(String?)? onValidate;
  final String? initialValue;
  final String? placeholder;
  final bool showTitle;
  final String title;
  final Color selectedColor;
  final String? valuesTitle;
 TextEditingController controller;
 final Color backgroundColor;
  // Rx value;
  // final double? width;

  @override
  State<ModalDropMenu> createState() => _ModalDropMenuState();
}

class _ModalDropMenuState extends State<ModalDropMenu> {
  bool isValueChanged = false;
  int selectedValueIndex = 1;
  String selectedValueString = '';
  int itemsCount = 0;

 // late TextEditingController controller;
  String? _startvalue;
  final focus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // widget.controller = TextEditingController();
    _startvalue = widget.initialValue;
    if (_startvalue != null) {
      widget.controller.text = _startvalue!;
    }
   // print(itemsCount);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.endIndex != null && widget.startIndex != null) {
      itemsCount = widget.endIndex! - (widget.startIndex! - 1);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showTitle)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        Container(
          // height: 56,
          constraints: const BoxConstraints(minHeight: 56),

          child: TextField(
            focusNode: focus,
            controller:widget. controller,
            readOnly: true,

            onTap: () async {
              // controller.text = ;
              await _getDate();
              print(widget. controller.text);
              // setState(() {});
            },
            onChanged: (v) {
              // widget.onValueChanged;
              setState(() {
                widget.onValueChanged?.call(v);
              });
            },
            decoration: InputDecoration(
              filled: true,
              hintText: widget.placeholder,
              fillColor:widget.backgroundColor,// Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: widget.borderRadius.resolve(TextDirection.rtl),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              border: OutlineInputBorder(
                borderRadius: widget.borderRadius.resolve(TextDirection.rtl),
              ),
              // isDense: true,
              suffixIconConstraints: BoxConstraints(maxWidth: 30),
              suffixIcon: SizedBox(
                width: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(
                    //   Icons.arrow_upward_rounded,
                    //   size: 10,
                    // ),
                    // Icon(
                    //   Icons.arrow_downward_rounded,
                    //   size: 10,
                    // ),
                    if (widget.twoArrowsShape)
                      Transform.rotate(
                        angle: -pi / 2,
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 10,
                        ),
                      ),
                    if (widget.twoArrowsShape) const SizedBox(height: 2),
                    if (widget.twoArrowsShape)
                      Transform.rotate(
                        angle: pi / 2,
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 10,
                        ),
                      ),
                    if (!widget.twoArrowsShape)
                      Transform.rotate(
                        angle: pi / 2,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 0),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 13,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // textInputAction: widget.actionOnSubmit,
          ),
        ),
      ],
    );
  }

  Future<void> _getDate() async {
    var value = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheetChild(
          values: widget.values,
          selectedColor: primaryColor,
          valuesTitle: widget.valuesTitle,
        );
        // return SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 10),
        //     child: SizedBox(
        //       width: double.infinity,
        //       child: widget.values != null
        //           ? Padding(
        //               padding: const EdgeInsets.all(15),
        //               child: Column(
        //                   mainAxisSize: MainAxisSize.min,
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     ...List.generate(
        //                       widget.values!.length,
        //                       (index) => InkWell(
        //                         onTap: () {
        //                           selectedValue = index;
        //                           print(widget.values![index]);
        //                           setState(() {});
        //                           // Navigator.pop(context, widget.values![index]);
        //                         },
        //                         child: Padding(
        //                           padding: const EdgeInsets.only(bottom: 6),
        //                           child: Container(
        //                             decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(10),
        //                               border: Border.all(
        //                                   color: selectedValue == index
        //                                       ? widget.selectedColor
        //                                       : Colors.grey.withOpacity(0.1)),
        //                               color: selectedValue == index
        //                                   ? widget.selectedColor
        //                                       .withOpacity(0.1)
        //                                   : Colors.transparent,
        //                             ),
        //                             child: Padding(
        //                               padding: const EdgeInsets.all(10),
        //                               child: Row(
        //                                 children: [
        //                                   Expanded(
        //                                     child: Text(
        //                                       widget.values![index],
        //                                       style: const TextStyle(
        //                                           fontSize: 16,
        //                                           fontWeight: FontWeight.bold),
        //                                     ),
        //                                   ),
        //                                   Container(
        //                                     height: 18,
        //                                     width: 18,
        //                                     decoration: BoxDecoration(
        //                                         color: Colors.grey
        //                                             .withOpacity(0.1),
        //                                         shape: BoxShape.circle,
        //                                         border: Border.all(
        //                                             color: selectedValue ==
        //                                                     index
        //                                                 ? AppColors.mainColor
        //                                                 : Colors.grey)),
        //                                     padding: const EdgeInsets.all(2),
        //                                     child: CircleAvatar(
        //                                       radius: 8,
        //                                       backgroundColor:
        //                                           selectedValue == index
        //                                               ? AppColors.mainColor
        //                                               : Colors.transparent,
        //                                     ),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     MyButton(
        //                       text: 'اختيار',
        //                       onPressed: () {},
        //                     )
        //                   ]),
        //             )
        //           : Column(
        //               mainAxisSize: MainAxisSize.min,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: List.generate(
        //                 itemsCount,
        //                 (index) => InkWell(
        //                   onTap: () {
        //                     print(widget.isTwoDigits
        //                         ? ((index) + widget.startIndex!)
        //                             .toString()
        //                             .padLeft(2, '0')
        //                         : ((index) + widget.startIndex!).toString());
        //                     Navigator.pop(
        //                         context, (index) + widget.startIndex!);
        //                   },
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(10),
        //                     child: SizedBox(
        //                       width: double.infinity,
        //                       child: Text(
        //                         widget.isTwoDigits
        //                             ? ((index) + widget.startIndex!)
        //                                 .toString()
        //                                 .padLeft(2, '0')
        //                             : ((index) + widget.startIndex!).toString(),
        //                         style: const TextStyle(
        //                             fontSize: 16, fontWeight: FontWeight.bold),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //     ),
        //   ),
        // );
      },
    );
    if (widget.values != null) {
      if (value != null) {
        selectedValueString = value;
        // widget.value.value = value.toString(); //#
        if (widget.onValueChanged != null) {
          widget.onValueChanged!(selectedValueString);
          isValueChanged = true;
        }
        // widget.value.value = selectedValueString;
       widget. controller.text = selectedValueString;
        // widget.onValueChanged?.call(controller.text);

        // validate();
      }
    } else {
      if (value != null) {
        selectedValueIndex = value;
        // widget.value.value = value.toString(); //#

        if (widget.onValueChanged != null) {
          widget.onValueChanged!(selectedValueIndex);
          isValueChanged = true;
        }
        selectedValueString = selectedValueIndex.toString();
        // widget.value.value = selectedValueString;
        // setState(() {});
     widget.   controller.text = selectedValueIndex.toString();
        // widget.onValueChanged?.call(_startvalue!);

        // validate();
      }
    }
  }
}

class BottomSheetChild extends StatefulWidget {
  const BottomSheetChild(
      {super.key,
      required this.values,
      required this.selectedColor,
      this.isTwoDigits = true,
      this.startIndex,
      this.endIndex,
      this.valuesTitle});
  final List<String>? values;
  final Color selectedColor;
  final bool isTwoDigits;
  final int? startIndex;
  final int? endIndex;
  final String? valuesTitle;
  @override
  State<BottomSheetChild> createState() => _BottomSheetChildState();
}

class _BottomSheetChildState extends State<BottomSheetChild> {
  int selectedValue = 0;
  int itemsCount = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          width: double.infinity,
          child: widget.values != null
              ? Padding(
                  padding: const EdgeInsetsDirectional.only(
                      bottom: 15, start: 15, end: 15, top: 8),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 3,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        ),
                        widget.valuesTitle != null
                            ? Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    widget.valuesTitle!,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: widget.selectedColor),
                                  ),
                                ))
                            : const SizedBox(),
                        ...List.generate(
                          widget.values!.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: InkWell(
                              onTap: () {
                                selectedValue = index;
                                //print(widget.values![index]);
                                setState(() {});
                                // Navigator.pop(context, widget.values![index]);
                              },
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: selectedValue == index
                                          ? widget.selectedColor
                                          : Colors.grey.withOpacity(0.1)),
                                  color: selectedValue == index
                                      ? widget.selectedColor.withOpacity(0.1)
                                      : Colors.transparent,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          widget.values![index],
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.1),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: selectedValue == index
                                                    ? primaryColor
                                                    : Colors.grey)),
                                        padding: const EdgeInsets.all(2),
                                        child: CircleAvatar(
                                          radius: 8,
                                          backgroundColor:
                                              selectedValue == index
                                                  ? primaryColor
                                                  : Colors.transparent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        MyButton(
                        
                          title: 'اختيار',
                          onTap: () {
                            Navigator.pop(
                                context, widget.values![selectedValue]);
                          },
                        )
                      ]),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    itemsCount,
                    (index) => InkWell(
                      onTap: () {
                       /* print(widget.isTwoDigits
                            ? ((index) + widget.startIndex!)
                                .toString()
                                .padLeft(2, '0')
                            : ((index) + widget.startIndex!).toString());
                            */
                        Navigator.pop(context, (index) + widget.startIndex!);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            widget.isTwoDigits
                                ? ((index) + widget.startIndex!)
                                    .toString()
                                    .padLeft(2, '0')
                                : ((index) + widget.startIndex!).toString(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
    
  }
}

// class ModalDropMenu extends StatefulWidget {
//   const ModalDropMenu({
//     super.key,
//     required this.onValueChanged,
//     // required this.itemsCount,
//     required this.text,
//     this.startIndex,
//     this.endIndex,
//     this.values,
//     this.isTwoDigits = false,
//     this.twoArrowsShape = true,
//     this.showTitle = false,
//     this.title = '',
//     this.borderRadius = const BorderRadiusDirectional.all(Radius.circular(8)),
//     // this.width,
//   }) : assert((values == null && (startIndex != null || endIndex != null)) ||
//             (values != null && (startIndex == null || endIndex == null)));
//   final void Function(Object)? onValueChanged;
//   final String text;
//   // final int itemsCount;
//   final int? startIndex;
//   final int? endIndex;
//   final List<String>? values;
//   final bool isTwoDigits;
//   final bool twoArrowsShape;
//   final bool showTitle;
//   final String title;
//   final BorderRadiusGeometry borderRadius;
//   // final double? width;

//   @override
//   State<ModalDropMenu> createState() => _ModalDropMenuState();
// }

// class _ModalDropMenuState extends State<ModalDropMenu> {
//   bool isValueChanged = false;
//   int selectedValueIndex = 1;
//   String selectedValueString = '';
//   int itemsCount = 0;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print(itemsCount);
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.endIndex != null && widget.startIndex != null) {
//       itemsCount = widget.endIndex! - (widget.startIndex! - 1);
//     }

//     return GestureDetector(
//       onTap: () async {
//         var value = await showModalBottomSheet(
//           context: context,
//           builder: (context) {
//             return SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: widget.values != null
//                       ? Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: List.generate(
//                             widget.values!.length,
//                             (index) => InkWell(
//                               onTap: () {
//                                 print(widget.values![index]);
//                                 Navigator.pop(context, widget.values![index]);
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(10),
//                                 child: SizedBox(
//                                   width: double.infinity,
//                                   child: Text(
//                                     widget.values![index],
//                                     style: const TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                       // ListView.builder(
//                       //     itemCount: widget.values!.length,
//                       //     // itemCount: widget.itemsCount,
//                       //     itemBuilder: (context, index) => InkWell(
//                       //       onTap: () {
//                       //         print('${widget.values![index]}');
//                       //         Navigator.pop(context, widget.values![index]);
//                       //       },
//                       //       child: Container(
//                       //         width: 40,
//                       //         child: Padding(
//                       //           padding: const EdgeInsets.all(10),
//                       //           child: Text(
//                       //             '${widget.values![index]}',
//                       //             style: TextStyle(
//                       //                 fontSize: 16, fontWeight: FontWeight.bold),
//                       //           ),
//                       //         ),
//                       //       ),
//                       //     ),
//                       //   )
//                       : Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: List.generate(
//                             itemsCount,
//                             (index) => InkWell(
//                               onTap: () {
//                                 print(widget.isTwoDigits
//                                     ? ((index) + widget.startIndex!)
//                                         .toString()
//                                         .padLeft(2, '0')
//                                     : ((index) + widget.startIndex!)
//                                         .toString());
//                                 Navigator.pop(
//                                     context, (index) + widget.startIndex!);
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(10),
//                                 child: SizedBox(
//                                   width: double.infinity,
//                                   child: Text(
//                                     widget.isTwoDigits
//                                         ? ((index) + widget.startIndex!)
//                                             .toString()
//                                             .padLeft(2, '0')
//                                         : ((index) + widget.startIndex!)
//                                             .toString(),
//                                     style: const TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                 ),
//               ),
//             );
//           },
//         );
//         if (widget.values != null) {
//           if (value != null) {
//             selectedValueString = value;
//             if (widget.onValueChanged != null) {
//               widget.onValueChanged!(selectedValueString);
//               isValueChanged = true;
//               setState(() {});
//             }
//           }
//         } else {
//           if (value != null) {
//             selectedValueIndex = value;
//             if (widget.onValueChanged != null) {
//               widget.onValueChanged!(selectedValueIndex);
//               isValueChanged = true;
//               setState(() {});
//             }
//           }
//         }
//       },
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (widget.showTitle)
//             Padding(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: Text(
//                 widget.title,
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           Container(
//             // width: widget.width,
//             padding: const EdgeInsets.symmetric(vertical: 15.5, horizontal: 15),
//             decoration: BoxDecoration(
//               color: AppConstants.greyLightColor,
//               borderRadius: widget.borderRadius,
//             ),
//             child: Row(
//               // mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   isValueChanged
//                       ? (widget.values != null
//                           ? selectedValueString
//                           : (widget.isTwoDigits
//                               ? selectedValueIndex.toString().padLeft(2, '0')
//                               : selectedValueIndex.toString()))
//                       : widget.text,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   children: [
//                     // Icon(
//                     //   Icons.arrow_upward_rounded,
//                     //   size: 10,
//                     // ),
//                     // Icon(
//                     //   Icons.arrow_downward_rounded,
//                     //   size: 10,
//                     // ),
//                     if (widget.twoArrowsShape)
//                       Transform.rotate(
//                         angle: -pi / 2,
//                         child: const Icon(
//                           Icons.arrow_back_ios_new_rounded,
//                           size: 10,
//                         ),
//                       ),
//                     if (widget.twoArrowsShape) const SizedBox(height: 4),
//                     if (widget.twoArrowsShape)
//                       Transform.rotate(
//                         angle: pi / 2,
//                         child: const Icon(
//                           Icons.arrow_back_ios_new_rounded,
//                           size: 10,
//                         ),
//                       ),
//                     if (!widget.twoArrowsShape)
//                       Transform.rotate(
//                         angle: pi / 2,
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(vertical: 6),
//                           child: Icon(
//                             Icons.arrow_back_ios_new_rounded,
//                             size: 13,
//                           ),
//                         ),
//                       ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
