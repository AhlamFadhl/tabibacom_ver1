import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tabibacom_ver1/layout/home_layout.dart';
import 'package:tabibacom_ver1/screens/splash/cubit/cubit.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return BlocProvider(
      create: (context) => SplashCubit()..getEnternetData(),
      child: BlocConsumer<SplashCubit, SplashStates>(
        listener: (context, state) {
          if (state is! SplashLoadingEnternetState) {
            Navigator.pop(context);
            Get.to(() => HomeLayout());
          }
        },
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/tabib_splash1.png'))),
              width: double.infinity,
              child: Stack(
                children: [
                  if (state is SplashLoadingEnternetState)
                    Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.35,
                        left: MediaQuery.of(context).size.width * 0.5,
                        child: CircularProgressIndicator()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
