import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibacom_ver1/models/category_model.dart';
import 'package:tabibacom_ver1/models/doctor_model.dart';
import 'package:tabibacom_ver1/models/hospital_model.dart';
import 'package:tabibacom_ver1/screens/home/cubit/states.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/network/remote/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeintialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<CategoryDoc> list_category = [];
  List<Hospital> list_hospital = [];

  getAllCategory() {
    list_category = [];
    emit(HomeLoadingCategoryState());
    DioHelper.postData(
      data: {},
      url: CATEGORY_GET_ALL,
    ).then((value) {
      print(value);
      List<dynamic> list = value.data;
      list_category = list.map((json) => CategoryDoc.fromJson(json)).toList();
      emit(HomeGetCategoryState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorGetCategoryState());
    });
  }

  getAllHospital() {
    list_hospital = [];
    emit(HomeLoadingHospitalState());
    DioHelper.postData(
      data: {},
      url: HOSPITAL_GET_ALL,
    ).then((value) {
      print(value);
      List<dynamic> list = value.data;
      list_hospital = list.map((json) => Hospital.fromJson(json)).toList();
      emit(HomeGetHospitalState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorGetHospitalState());
    });
  }
}
