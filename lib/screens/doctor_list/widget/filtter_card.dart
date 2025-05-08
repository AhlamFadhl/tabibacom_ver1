import 'package:flutter/material.dart';
import 'package:tabibacom_ver1/widgets/my_text.dart';

class FiltterCard extends StatelessWidget {
  String? title;
  bool isSearched ;

   FiltterCard({super.key,required this.title, this.isSearched=false});


  @override
  Widget build(BuildContext context) {
    return   Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),  
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 1,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0)
                            ],
                          ),
                          child: MyText(title??'',color: isSearched?Colors.black:Colors.grey,),
                        ),
                        if(isSearched)
                        CircleAvatar(radius: 5,backgroundColor: Colors.red,)
                      ],
                    );
  }
}