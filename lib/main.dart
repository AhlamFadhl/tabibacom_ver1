import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:tabibacom_ver1/screens/doctor_list/cubit/cubit.dart';
import 'package:tabibacom_ver1/screens/home/cubit/cubit.dart';
import 'package:tabibacom_ver1/screens/insurance_list/cubit/cubit.dart';
import 'package:tabibacom_ver1/screens/region_list/cubit/cubit.dart';
import 'package:tabibacom_ver1/screens/splash/splash_page.dart';
import 'package:tabibacom_ver1/shared/cubit/cubit.dart';
import 'package:tabibacom_ver1/shared/cubit/states.dart';
import 'package:tabibacom_ver1/shared/network/local/cache_helper.dart';
import 'package:tabibacom_ver1/shared/network/remote/dio_helper.dart';
import 'package:tabibacom_ver1/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()
            ..changeIndex(0)
            ..getUserSignIn(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()
            //  ..getAllDoctors()
            ..getAllCategory()
            ..getAllHospital(),
        ),
        BlocProvider(create: (context) => DoctorCubit()..getAllDoctors()),
        BlocProvider(
          create: (context) => RegionCubit()..getAllRegion(),
        ),
        BlocProvider(
          create: (context) => InsuranceCubit()..getAllInsurance(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            locale: const Locale('ar'),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('ar', 'YE'), // Arabic
              Locale('en', 'US'), // English
            ],
            home: SplashPage(),
          );
        },
      ),
    );
  }
}
