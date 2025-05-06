import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final image;
  final title;
  const ServiceCard({super.key,required this.title, required this.image,});

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: const EdgeInsets.all(10),
     padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 1,
              offset: Offset(0, 0),
              spreadRadius: 0)
        ],
      ),
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
