import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:tabibacom_ver1/models/appointment_details_model.dart';
import 'package:tabibacom_ver1/models/book_model.dart';
import 'package:tabibacom_ver1/models/doctor_model.dart';
import 'package:tabibacom_ver1/shared/components/constants.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/network/remote/dio_helper.dart';

part 'states.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentStates> {
  BookAppointmentCubit() : super(BookAppointmentInitial());

  static BookAppointmentCubit get(context) => BlocProvider.of(context);

  List<DateTime> days = [];
  getDaysAppointment(AppointmentDetails apnt) {
    days = getDaysInBetween(
      DateTime.now(),
      DateTime.now().add(
        Duration(days: ((apnt.apnt_type ?? 0) - 1)),
      ),
    );
  }

  List<DateTime> getTimesInDateAppointment(
      List<AppointmentDetails> appointments, DateTime date1, Doctor doc) {
    AppointmentDetails apnt = appointments
        .where((element) => element.apnt_day == getDayWeekend(date1.weekday))
        .toList()[0];
    List<DateTime> list = [];
    if (!(apnt.apnt_avalible == 0)) {
      var date = DateTime.parse(DateFormat('yyyy-MM-dd').format(date1) +
          ' ' +
          apnt.apnt_from_time); //apnt.apnt_from_time
      var secondDate = DateTime.parse(DateFormat('yyyy-MM-dd').format(date1) +
              ' ' +
              apnt.apnt_to_time) // apnt.apnt_to_time
          .add(Duration(minutes: (apnt.apnt_period * -2)));
      list.add(date);
      while (date.millisecondsSinceEpoch < secondDate.millisecondsSinceEpoch) {
        date = date.add(Duration(minutes: apnt.apnt_period));
        list.add(date);
      }
    }
    return list;
  }

  int getDayWeekend(int day) {
    if (day == 6)
      return 1;
    else if (day == 7)
      return 2;
    else if (day == 1)
      return 3;
    else if (day == 2)
      return 4;
    else if (day == 3)
      return 5;
    else if (day == 4)
      return 6;
    else if (day == 5) return 7;
    return 0;
  }
}
