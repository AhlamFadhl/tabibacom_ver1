import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibacom_ver1/models/category_model.dart';
import 'package:tabibacom_ver1/models/doctor_model.dart';
import 'package:tabibacom_ver1/models/hospital_types_model.dart';
import 'package:tabibacom_ver1/models/insurance.dart';
import 'package:tabibacom_ver1/models/region.dart';
import 'package:tabibacom_ver1/screens/doctor_list/cubit/states.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/network/remote/dio_helper.dart';

class DoctorCubit extends Cubit<DoctorStates> {
  DoctorCubit() : super(DoctorintialState());

  static DoctorCubit get(context) => BlocProvider.of(context);

  CategoryDoc? cat;
  RegionModel? region;
  InsuranceModel? insurance;
  HospitalTypes? hospitalType;

  List<HospitalTypes> list_types = [
    HospitalTypes(hstype_no: 1, hstype_name: 'مستشفى', hstype_image: ''),
    HospitalTypes(hstype_no: 1, hstype_name: 'مستوصف', hstype_image: ''),
    HospitalTypes(hstype_no: 1, hstype_name: 'مركز', hstype_image: ''),
    HospitalTypes(hstype_no: 1, hstype_name: 'عياده', hstype_image: ''),
  ];

  
  
  TextEditingController controllerSearch=TextEditingController();
  
  List<Doctor> list_doctors = [];

  changeFiltterRegion(RegionModel reg) {
    region = reg;
    emit(DoctorChangeFiltterRegState());
  }

  changeFiltterInsurance(InsuranceModel ins) {
    insurance = ins;
    emit(DoctorChangeFiltterInsState());
  }

  changeFiltterType(HospitalTypes type) {
    hospitalType = type;
    emit(DoctorChangeFiltterTypeState());
  }

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
