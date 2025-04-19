import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibacom_ver1/models/category_model.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/network/remote/dio_helper.dart';

part 'hospital_profile_state.dart';

class HospitalProfileCubit extends Cubit<HospitalProfileState> {
  HospitalProfileCubit() : super(HospitalProfileInitial());
  static HospitalProfileCubit get(context) => BlocProvider.of(context);

  List<CategoryDoc> list_categories = [];
  getAllCategories(hsptl) {
    list_categories = [];
    emit(HospitalProfileLoading());
    DioHelper.postData(
      data: {
        'hsptl': hsptl,
      },
      url: HOSPITAL_CATEGOREIES,
    ).then((value) {
      print(value);
      List<dynamic> list = value.data;
      list_categories = list.map((json) => CategoryDoc.fromJson(json)).toList();
      emit(HospitalProfileGet());
    }).catchError((error) {
      print(error.toString());
      emit(HospitalProfileError());
    });
  }
}
