import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibacom_ver1/models/category_model.dart';
import 'package:tabibacom_ver1/models/hospital_departments.dart';
import 'package:tabibacom_ver1/models/insurance.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/network/remote/dio_helper.dart';

part 'state.dart';

class HospitalProfileCubit extends Cubit<HospitalProfileState> {
  HospitalProfileCubit() : super(HospitalProfileInitial());
  static HospitalProfileCubit get(context) => BlocProvider.of(context);

  List<CategoryDoc> list_categories = [];
  List<HospitalDepartments> list_departments = [];
  List<InsuranceModel> list_insurance=[];

  getAllCategories(hsptl) {
    list_categories = [];
    emit(HospitalCategoryLoading());
    DioHelper.postData(
      data: {
        'hsptl_no': hsptl,
      },
      url: HOSPITAL_CATEGOREIES,
    ).then((value) {
      print(value);
      List<dynamic> list = value.data;
      list_categories = list.map((json) => CategoryDoc.fromJson(json)).toList();
      emit(HospitalCategoryGet());
    }).catchError((error) {
      print(error.toString());
      emit(HospitalCategoryError());
    });
  }

   getAllDepartments(hsptl) {
    list_departments = [];
    emit(HospitalProfileLoading());
    DioHelper.postData(
      data: {
        'hsptl_no': hsptl,
      },
      url: HOSPITAL_DEPARTMENTS,
    ).then((value) {
      print(value);
      List<dynamic> list = value.data;
      list_departments = list.map((json) => HospitalDepartments.fromJson(json)).toList();
      emit(HospitalProfileGet());
    }).catchError((error) {
      print(error.toString());
      emit(HospitalProfileError());
    });
  }

    getAllInsurance(hsptl) {
    emit(HospitalInsuranceLoading());

    DioHelper.postData(
      data: {
           'hsptl_no': hsptl,
      },
      url: HOSPITAL_INSURANCE,
    ).then((value) {
      List<dynamic> list = value.data;
      list_insurance =
          list.map((json) => InsuranceModel.fromJson(json)).toList();
      list_insurance.insert(
          0, InsuranceModel(ins_no: 0, ins_name: 'لا أريد اختيار تأمين'));
      emit(HospitalInsuranceGet());
    }).catchError((error) {
      print(error.toString());
      emit(HospitalInsuranceError());
    });
  }
}
