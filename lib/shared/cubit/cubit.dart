import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibacom_ver1/models/users_model.dart';
import 'package:tabibacom_ver1/screens/home/home_page.dart';
import 'package:tabibacom_ver1/screens/my_transactions/my_transactions_page.dart';
import 'package:tabibacom_ver1/screens/settings/settings_page.dart';
import 'package:tabibacom_ver1/shared/components/constants.dart';
import 'package:tabibacom_ver1/shared/cubit/states.dart';
import 'package:tabibacom_ver1/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppintialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    HomePage(),
    MyTransactionsPage(),
    SettingsPage(),
  ];
  List<String> titles = [
    'الرئيسية',
    'حجوزاتي',
    'الإعدادات',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  int usrNo = 0;
  String usrPhone = '';
  String usrName = '';

  getUserSignIn() {
    usrNo = CacheHelper.getData(key: KeyUserNo) ?? 0;
    usrName = CacheHelper.getData(key: KeyUserName) ?? '';
    usrPhone = CacheHelper.getData(key: KeyUserPhone) ?? '';
  }

  saveUserSignIn() {
    CacheHelper.saveData(key: KeyUserNo, value: usrNo);
    CacheHelper.saveData(key: KeyUserName, value: usrName);
    CacheHelper.saveData(key: KeyUserPhone, value: usrPhone);
  }
}
