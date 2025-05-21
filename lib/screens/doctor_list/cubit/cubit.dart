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
  DoctorCubit({required this.cat,required this.region,required this.insurance})
      : super(DoctorintialState());

  static DoctorCubit get(context) => BlocProvider.of(context);

  CategoryDoc cat;
  RegionModel region;
  InsuranceModel insurance;
  HospitalTypes hospitalType =
      HospitalTypes(hstype_no: 0, hstype_name: '', hstype_image: '');

  List<HospitalTypes> list_types = [
    HospitalTypes(hstype_no: 1, hstype_name: 'مستشفى', hstype_image: ''),
    HospitalTypes(hstype_no: 2, hstype_name: 'مستوصف', hstype_image: ''),
    HospitalTypes(hstype_no: 3, hstype_name: 'مركز', hstype_image: ''),
    HospitalTypes(hstype_no: 4, hstype_name: 'عياده', hstype_image: ''),
  ];

  TextEditingController controllerSearch = TextEditingController();
  bool isLoading = false;
  List<Doctor> list_doctors = [];
  List<Doctor> list_fake_doctors = [
    Doctor(
      doc_no: 0,
      cat_no: 0,
      doc_first_name: 'hfjhfhjfj',
      doc_last_name: 'nbvhgfhj',
      doc_desc: 'hg jgjgjk jkjh kgkjhgmjhkj kjhkjykjh jkjkuktg',
      doc_price: 400,
      doc_date_joined: "2025-01-01",
      doc_specialist: 'jhkjhk',
      hsptl_logo: 'hospital.jpg',
      doc_image: 'doctorF.jpg',
      doc_user: 0,
      doc_birth_day: '',
      hsptl_name: 'jhjk',
      hsptl_address: 'jhgjh',
    ),
    Doctor(
      doc_no: 0,
      cat_no: 0,
      doc_first_name: 'hfjhfhjfj',
      doc_last_name: 'nbvhgfhj',
      doc_desc: 'hg jgjgjk jkjh kgkjhgmjhkj kjhkjykjh jkjkuktg',
      doc_price: 400,
      doc_date_joined: "2025-01-01",
      doc_specialist: 'jhkjhk',
      hsptl_logo: 'hospital.jpg',
      doc_image: 'doctorF.jpg',
      doc_user: 0,
      doc_birth_day: '',
      hsptl_name: 'jhjk',
      hsptl_address: 'jhgjh',
    ),
    Doctor(
      doc_no: 0,
      cat_no: 0,
      doc_first_name: 'hfjhfhjfj',
      doc_last_name: 'nbvhgfhj',
      doc_desc: 'hg jgjgjk jkjh kgkjhgmjhkj kjhkjykjh jkjkuktg',
      doc_price: 400,
      doc_date_joined: "2025-01-01",
      doc_specialist: 'jhkjhk',
      hsptl_logo: 'hospital.jpg',
      doc_image: 'doctorF.jpg',
      doc_user: 0,
      doc_birth_day: '',
      hsptl_name: 'jhjk',
      hsptl_address: 'jhgjh',
    ),
  ];

  changeFiltterRegion(RegionModel reg) {
    region = reg;
    getAllDoctorsByFiltter();
    emit(DoctorChangeFiltterRegState());
  }

  changeFiltterInsurance(InsuranceModel ins) {
    insurance = ins;
    getAllDoctorsByFiltter();
    emit(DoctorChangeFiltterInsState());
  }

  changeFiltterType(HospitalTypes type) {
    hospitalType = type;
    getAllDoctorsByFiltter();
    emit(DoctorChangeFiltterTypeState());
  }

  getAllDoctorsByFiltter() {
    isLoading = true;
    list_doctors = [];
    emit(DoctorLoadingState());
    DioHelper.postData(
      data: {
        'serv': 1,
        'cat': cat.cat_no,
        'ins': insurance.ins_no,
        'regtion': region.drct_id,
        'type': hospitalType.hstype_no,
        'q': controllerSearch.text,
      },
      url: DOCTORS_FILTTER,
    ).then((value) {
      isLoading = false;
      print(value);
      List<dynamic> list = value.data;
      list_doctors = list.map((json) => Doctor.fromJson(json)).toList();
      emit(DoctorGetSucessState());
    }).catchError((error) {
      isLoading = false;
      print(error.toString());
      emit(DoctorGetFailState());
    });
  }

  getAllDoctors() {
    isLoading = true;
    list_doctors = [];
    emit(DoctorLoadingState());
    DioHelper.postData(
      data: {},
      url: DOCTORS_GET_All,
    ).then((value) {
      isLoading = false;
      print(value);
    //  List<dynamic> list = value.data;

      /// list_doctors = list.map((json) => Doctor.fromJson(json)).toList();
      emit(DoctorGetSucessState());
    }).catchError((error) {
      isLoading = false;
      print(error.toString());
      emit(DoctorGetFailState());
    });
  }

  getAllDoctorsByCat_service() {
    isLoading = true;
    list_doctors = [];
    emit(DoctorLoadingState());
    DioHelper.postData(
      data: {},
      url: DOCTORS_GET_All,
    ).then((value) {
      isLoading = false;
      print(value);
      //List<dynamic> list = value.data;
      // list_doctors = list.map((json) => Doctor.fromJson(json)).toList();
      emit(DoctorGetSucessState());
    }).catchError((error) {
      isLoading = false;
      print(error.toString());
      emit(DoctorGetFailState());
    });
  }
}
