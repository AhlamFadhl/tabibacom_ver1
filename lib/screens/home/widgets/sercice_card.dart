import 'package:flutter/material.dart';
import 'package:tabibacom_ver1/widgets/my_border.dart';
import 'package:tabibacom_ver1/widgets/my_text.dart';
import 'package:tabibacom_ver1/widgets/sized_box.dart';

class ServiceCard extends StatelessWidget {
  final image;
  final title;
  const ServiceCard({super.key,required this.title, required this.image,});

  @override
  Widget build(BuildContext context) {
    return MyBorder(
     margin: const EdgeInsets.all(10),
     padding: const EdgeInsets.all(20),
     
      child: Column(

        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(image),
          ),
          CustomSizedBox(height: 6,),
          MyText(title,textAlign: TextAlign.center,fontSize: 15,),
        ],
      ),
    );
  }
}
