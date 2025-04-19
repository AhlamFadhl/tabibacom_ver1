import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tabibacom_ver1/models/appointment_details_model.dart';
import 'package:tabibacom_ver1/models/book_model.dart';
import 'package:tabibacom_ver1/models/doctor_model.dart';
import 'package:tabibacom_ver1/screens/book_page/book_page.dart';
import 'package:tabibacom_ver1/screens/doctor_appointment/cubit/cubit.dart';
import 'package:tabibacom_ver1/screens/doctor_appointment/doctor_date_appointment.dart';
import 'package:tabibacom_ver1/shared/components/components.dart';
import 'package:tabibacom_ver1/shared/components/constants.dart';
import 'package:tabibacom_ver1/shared/styles/colors.dart';

class DoctorAppointment extends StatelessWidget {
  Doctor crrnt_doctor;
  List<AppointmentDetails> appointments;
  DoctorAppointment({required this.crrnt_doctor, required this.appointments});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookAppointmentCubit()..getDaysAppointment(appointments[0]),
      child: BlocConsumer<BookAppointmentCubit, BookAppointmentStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = BookAppointmentCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('مواعيد الحجز المتاحة'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    buildDoctorItem_Top(crrnt_doctor),
                    SizedBox(
                      height: 10,
                    ),
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(cubit.days.length, (index) {
                        List<DateTime> list = cubit.getTimesInDateAppointment(
                            appointments, cubit.days[index], crrnt_doctor);

                        return Container(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  DateFormat.yMMMEd()
                                      .format(
                                        cubit.days[index],
                                      )
                                      .toString(),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ConditionalBuilder(
                                condition: list.length != 0,
                                fallback: (context) => Container(
                                  child: Text('غير متاح'),
                                ),
                                builder: (context) => DoctorDateAppointMent(
                                    crrnt_doctor: crrnt_doctor,
                                    appointment: appointments[0],
                                    crnt_date: cubit.days[index],
                                    list_times: list),
                              ),
                              /*   Wrap(
                                children: List.generate(
                                  list.length,
                                  (i) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        BookModel book = BookModel(
                                          book_no: 0,
                                          doc_no: crrnt_doctor.doc_no,
                                          hsptl_no: crrnt_doctor.hsptl_no!,
                                          usr_no: 0,
                                          book_for_you: 0,
                                          ptn_no: 0,
                                          pt_name: '',
                                          pt_phone: '',
                                          book_date: cubit.days[index]
                                              .toLocal()
                                              .toString(),
                                          book_time: list[i],
                                          book_state: 0,
                                          date_enter: DateTime.now().toString(),
                                        );
                                        Get.to(BookPage(
                                            crrnt_doctor: crrnt_doctor,
                                            book: book));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10.0),
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: secondColor.withOpacity(0.4),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: Text(
                                              DateFormat.jm().format(list[i])),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            */
                            ],
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
