import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tabibacom_ver1/models/region.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/network/remote/dio_helper.dart';

part 'state.dart';

class RegionCubit extends Cubit<RegionState> {
  RegionCubit() : super(RegionInitial());
  static RegionCubit get(context) => BlocProvider.of(context);
  List<RegionModel> list_region = [];

  getAllRegion() {
    emit(RegionLoading());

    DioHelper.postData(
      data: {},
      url: REGION_GET,
    ).then((value) {
      List<dynamic> list = value.data;
      list_region = list.map((json) => RegionModel.fromJson(json)).toList();
      emit(RegionGet());
    }).catchError((error) {
      print(error.toString());
      emit(RegionError());
    });
  }
}
