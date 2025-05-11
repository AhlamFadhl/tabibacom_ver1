import 'package:flutter/material.dart';
import 'package:tabibacom_ver1/widgets/my_border.dart';

class ServiceCard extends StatelessWidget {
  final image;
  final title;
  const ServiceCard({super.key,required this.title, required this.image,});

  @override
  Widget build(BuildContext context) {
    return MyBorder(
     margin: const EdgeInsets.all(10),
     padding: const EdgeInsets.all(20),
     
      height: 170,
      child: Column(

        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(image),
          ),
          SizedBox(height: 4,),
          Text(title,textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
