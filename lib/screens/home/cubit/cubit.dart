import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibacom_ver1/models/category_model.dart';
import 'package:tabibacom_ver1/models/city.dart';
import 'package:tabibacom_ver1/models/hospital_model.dart';
import 'package:tabibacom_ver1/models/insurance.dart';
import 'package:tabibacom_ver1/models/region.dart';
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
    }).onError(
      (error, stackTrace) {
        print(error);
      },
    );
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

  List<InsuranceModel> list_insurance = [];

  getAllInsurance() {
    emit(HomeInsuranceLoading());

    DioHelper.postData(
      data: {},
      url: INSURANCE_GET,
    ).then((value) {
      List<dynamic> list = value.data;
      list_insurance =
          list.map((json) => InsuranceModel.fromJson(json)).toList();
      list_insurance.insert(
          0, InsuranceModel(ins_no: 0, ins_name: 'لا أريد اختيار تأمين'));
      emit(HomeInsuranceGet());
    }).catchError((error) {
      print(error.toString());
      emit(HomeInsuranceError());
    });
  }

  List<RegionModel> list_region = [];

  getAllRegion(CityModel city) {
    emit(HomeRegionLoading());

    DioHelper.postData(
      data: {
        'cty_id': city.cty_id,
      },
      url: REGION_GET,
    ).then((value) {
      List<dynamic> list = value.data;
      list_region = list.map((json) => RegionModel.fromJson(json)).toList();
      list_region.insert(0, RegionModel(drct_id: 0, drct_name: city.cty_name));
      emit(HomeRegionGet());
    }).catchError((error) {
      print(error.toString());
      emit(HomeRegionError());
    });
  }
}
