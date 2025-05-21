import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibacom_ver1/models/appointment_details_model.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/network/remote/dio_helper.dart';

part 'states.dart';

class DoctorProfileCubit extends Cubit<DoctorProfileStates> {
  DoctorProfileCubit() : super(DoctorProfileInitial());
  static DoctorProfileCubit get(context) => BlocProvider.of(context);
  List<AppointmentDetails> list_appoinment = [];

  getAppointmentDoctor(doc, hsptl) {
    list_appoinment = [];
    emit(DoctorProfileLoading());
    DioHelper.postData(
      data: {
        'doc': doc,
        'hsptl': hsptl,
      },
      url: APPONTMENT_DETAILS,
    ).then((value) {
      print(value);
      List<dynamic> list = value.data;
      list_appoinment =
          list.map((json) => AppointmentDetails.fromJson(json)).toList();
      emit(DoctorProfileGet());
    }).catchError((error) {
      print(error.toString());
      emit(DoctorProfileError());
    });
  }
}
