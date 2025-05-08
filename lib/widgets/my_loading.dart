
import 'package:flutter/material.dart';

class MyLoadding extends StatelessWidget {
  final String title;
  const MyLoadding({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                        children: [
                          CircularProgressIndicator(),
                          Text(title),
                        ],
                      ),
                  );
  }
}