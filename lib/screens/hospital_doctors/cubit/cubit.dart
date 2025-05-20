import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:meta/meta.dart';
import 'package:tabibacom_ver1/models/category_model.dart';
import 'package:tabibacom_ver1/models/doctor_model.dart';
import 'package:tabibacom_ver1/models/hospital_model.dart';
import 'package:tabibacom_ver1/models/insurance.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/network/remote/dio_helper.dart';

part 'state.dart';

class HospitalDoctorsCubit extends Cubit<HospitalDoctorsState> {
  HospitalDoctorsCubit(
      {required this.hospital,
      required this.list_categories,
      required this.list_insurance})
      : super(HospitalDoctorsInitial());
  static HospitalDoctorsCubit get(context) => BlocProvider.of(context);

  Hospital hospital;
  bool isLoading = true;
  List<Doctor> list_doctors = [];

  setListData() {
    selectedCat = list_categories[0];
    selectedInsurance = list_insurance[0];
    getDoctorsHospital();
  }

  List<CategoryDoc> list_categories =[
     
    ];
  List<InsuranceModel> list_insurance =[
     
    ];

  CategoryDoc? selectedCat;
  InsuranceModel? selectedInsurance;

  getDoctorsByCat(CategoryDoc cat) {
    selectedCat = cat;
    getDoctorsHospital();
    emit(HospitalLoadingState());
  }

  getDoctorsByInsurance(InsuranceModel ins) {
    selectedInsurance = ins;
    getDoctorsHospital();
    emit(HospitalLoadingState());
  }

  getDoctorsHospital() {
    isLoading = true;
    emit(HospitalDoctorsLoadingState());
    DioHelper.postData(url: Doctors_Hospital, data: {
      'serv': 1,
      'cat': selectedCat!.cat_no,
      'ins': selectedInsurance!.ins_no,
      'hsptl': hospital.hsptl_no
    }).then(
      (value) {
        if (value.statusCode == 200) {
          List<dynamic> list = value.data;
          list_doctors = list.map((json) => Doctor.fromJson(json)).toList();
          isLoading = false;
          emit(HospitalDoctorsGetState());
        }
      },
    ).catchError((error) {
      print(error);
      isLoading = false;
      emit(HospitalDoctorsErrorState());
    });
  }
}
