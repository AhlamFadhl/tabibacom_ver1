import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibacom_ver1/models/doctor_model.dart';
import 'package:tabibacom_ver1/screens/doctor_list/cubit/states.dart';
import 'package:tabibacom_ver1/screens/home/cubit/states.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/network/remote/dio_helper.dart';

class DoctorCubit extends Cubit<DoctorStates> {
  DoctorCubit() : super(DoctorintialState());

  static DoctorCubit get(context) => BlocProvider.of(context);

    List<Doctor> list_doctors = [];

      getAllDoctors() {
    list_doctors = [];
    emit(DoctorLoadingState());
    DioHelper.postData(
      data: {},
      url: DOCTORS_GET_All,
    ).then((value) {
      print(value);
      List<dynamic> list = value.data;
      list_doctors = list.map((json) => Doctor.fromJson(json)).toList();
      emit(DoctorGetSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(DoctorGetFailState());
    });
  }

       getAllDoctorsByCat_service() {
    list_doctors = [];
    emit(DoctorLoadingState());
    DioHelper.postData(
      data: {},
      url: DOCTORS_GET_All,
    ).then((value) {
      print(value);
      List<dynamic> list = value.data;
      list_doctors = list.map((json) => Doctor.fromJson(json)).toList();
      emit(DoctorGetSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(DoctorGetFailState());
    });
  }

}
