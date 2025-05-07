import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tabibacom_ver1/models/insurance.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/network/remote/dio_helper.dart';

part 'state.dart';

class InsuranceCubit extends Cubit<InsuranceState> {
  InsuranceCubit() : super(InsuranceInitial());
  static InsuranceCubit get(context) => BlocProvider.of(context);

  List<InsuranceModel> list_insurance = [];

  getAllInsurance() {
    emit(InsuranceLoading());

    DioHelper.postData(
      data: {},
      url: INSURANCE_GET,
    ).then((value) {
      List<dynamic> list = value.data;
      list_insurance =
          list.map((json) => InsuranceModel.fromJson(json)).toList();
      emit(InsuranceGet());
    }).catchError((error) {
      print(error.toString());
      emit(InsuranceError());
    });
  }
}
