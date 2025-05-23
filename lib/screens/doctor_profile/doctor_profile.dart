import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tabibacom_ver1/models/appointment_details_model.dart';
import 'package:tabibacom_ver1/models/doctor_model.dart';
import 'package:tabibacom_ver1/screens/doctor_appointment/doctor_appointment_page.dart';
import 'package:tabibacom_ver1/screens/doctor_profile/cubit/cubit.dart';
import 'package:tabibacom_ver1/screens/signin/signin_page.dart';
import 'package:tabibacom_ver1/shared/components/components.dart';
import 'package:tabibacom_ver1/shared/components/constants.dart';
import 'package:tabibacom_ver1/shared/cubit/cubit.dart';
import 'package:tabibacom_ver1/shared/styles/colors.dart';
import 'package:tabibacom_ver1/shared/styles/styles.dart';

class DoctorProfile extends StatelessWidget {
  Doctor crrnt_doctor;
  DoctorProfile({required this.crrnt_doctor});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorProfileCubit()
        ..getAppointmentDoctor(crrnt_doctor.doc_no, crrnt_doctor.hsptl_no),
      child: BlocConsumer<DoctorProfileCubit, DoctorProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DoctorProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'بيانات الطبيب',
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ////Top Informatio
                    buildDoctorItem_Top(crrnt_doctor),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'متوسط الأنتظار',
                                style: styleText,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.watch_later_outlined,
                                    size: 20,
                                    color: primaryColor,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    (crrnt_doctor.avg_time ?? 0).toString(),
                                    style: styleText_mini_colored,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(height: 30, child: VerticalDivider(color: Colors.grey.shade300,)),
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              'سعر الكشف',
                              style: styleText,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.monetization_on_outlined,
                                  size: 20,
                                  color: primaryColor,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  (crrnt_doctor.doc_price ?? 0).toString(),
                                  style: styleText_mini_colored,
                                ),
                              ],
                            ),
                          ],
                        )),
                      ],
                    ),
                    Divider(color:Colors.grey.shade300,),

                    ///About Doctor
                    Text(
                      'نبذة عن الطبيب',
                      style: styleHeadline,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '''${crrnt_doctor.doc_desc}''',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ////Images

                    if (crrnt_doctor.doc_images != null &&
                        crrnt_doctor.doc_images != '')
                      Column(
                        children: [
                          Text(
                            'الصور',
                            style: styleHeadline,
                          ),
                          Row(
                            children: List<Container>.generate(
                              crrnt_doctor.doc_images!
                                  .split(',')
                                  .toList()
                                  .length,
                              (index) => Container(
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: crrnt_doctor.doc_images!
                                        .split(',')
                                        .toList()[index],
                                    placeholder: (context, url) => Container(),
                                    errorWidget: (context, url, error) =>
                                        Container(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    /////مواعيد لعمل
                    Text(
                      'مواعيد العمل',
                      style: styleHeadline,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (state is DoctorProfileLoading)
                      CircularProgressIndicator(),
                    if (state is DoctorProfileGet)
                      buildTimeTable(cubit.list_appoinment),

                    if (state is DoctorProfileError) Container(),
                    /*  if (cubit.list_appoinment.length != 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cubit.list_appoinment[0].apnt_type == 1
                                ? 'يومي'
                                : 'اسبوعي',
                          ),
                          Divider(),
                        ],
                      ),*/
                    if (cubit.list_appoinment.length != 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cubit.list_appoinment[0].attend_way == 1
                                ? 'الحضور حسب الوقت المحدد'
                                : 'الدخول بأسبقة الحضور',
                            style:
                                styleText_mini_colored.copyWith(fontSize: 14),
                          ),
                        //  Divider(color: lightColor,),
                        SizedBox(height: 20,),
                        ],
                      ),
                    ////Book
                    if (state is DoctorProfileGet)
                      defaultButton(
                        function: () {
                          if (AppCubit.get(context).usrNo != 0) {
                            Get.to(
                              () => DoctorAppointment(
                                  crrnt_doctor: crrnt_doctor,
                                  appointments: cubit.list_appoinment),
                            );
                          } else {
                            Get.to(
                              () => SignInPage(),
                            );
                          }
                        },
                        text: 'حجز موعد',
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  buildTimeTable(List<AppointmentDetails> list) {
    return Column(
      children: [
        if (list.length >= 1) buidCardTime(list[0]),
        if (list.length >= 2) buidCardTime(list[1]),
        if (list.length >= 3) buidCardTime(list[2]),
        if (list.length >= 4) buidCardTime(list[3]),
        if (list.length >= 5) buidCardTime(list[4]),
        if (list.length >= 6) buidCardTime(list[5]),
        if (list.length >= 7) buidCardTime(list[6]),
      ],
    );
  }

  buidCardTime(AppointmentDetails apnt) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getDayName(apnt.apnt_day),
              ),
              Spacer(),
              if (!(apnt.apnt_avalible == 0))
                Text(
                  DateFormat.jm().format(
                          DateTime.parse("2020-01-01 " + apnt.apnt_from_time)) +
                      ' - ',
                ),
              if (!(apnt.apnt_avalible == 0))
                Text(
                  DateFormat.jm().format(
                          DateTime.parse("2020-01-01 " + apnt.apnt_to_time)) +
                      '  ',
                ),
              if (apnt.apnt_avalible == 0)
                Text(
                  'غير متاح',
                ),
            ],
          ),
          Divider(color: Colors.grey.shade300,),
        ],
      );
}
