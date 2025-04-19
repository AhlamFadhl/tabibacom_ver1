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
import 'package:tabibacom_ver1/shared/cubit/cubit.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/network/remote/dio_helper.dart';
import 'package:tabibacom_ver1/shared/styles/colors.dart';

class DoctorDateAppointMent extends StatefulWidget {
  Doctor crrnt_doctor;
  AppointmentDetails appointment;
  DateTime crnt_date;
  List<DateTime> list_times;

  DoctorDateAppointMent({
    required this.crrnt_doctor,
    required this.appointment,
    required this.crnt_date,
    required this.list_times,
  });

  @override
  State<DoctorDateAppointMent> createState() => _DoctorDateAppointMentState();
}

class _DoctorDateAppointMentState extends State<DoctorDateAppointMent> {
  List<int> list_int = [];
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetailsBookDate().then((value) => setState(() {})).catchError((erorr) {
      setState(() {});
    });
  }

  Future<void> getDetailsBookDate() async {
    List<BookModel> list_book = [];
    try {
      var value = await DioHelper.postData(url: BOOK_DOCTOR_DATE, data: {
        'doc': widget.crrnt_doctor.doc_no,
        'hsptl': widget.crrnt_doctor.hsptl_no,
        'date': DateFormat('yyyy-MM-dd').format(widget.crnt_date)
      });
//
      print(value);
      List<dynamic> list = value.data;
      list_book = list.map((json) => BookModel.fromJson(json)).toList();
      widget.list_times.forEach((element) {
        List<BookModel> bk = list_book
            .where((x) =>
                DateFormat.Hm()
                    .format(DateTime.parse("2023-01-01 " + x.book_time)) ==
                DateFormat.Hm().format(element))
            .toList();
        if (bk.length != 0)
          list_int.add(1);
        else
          list_int.add(0);
      });
      isLoading = false;
    } catch (ex) {
      print(ex.toString());
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookAppointmentCubit, BookAppointmentStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: (!isLoading),
          fallback: (context) => CircularProgressIndicator(),
          builder: (context) => Wrap(
            children: List.generate(
              widget.list_times.length,
              (i) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    if ((list_int.length > 0 && list_int[i] == 0) ||
                        list_int.length == 0) {
                      BookModel book = BookModel(
                        book_no: 0,
                        doc_no: widget.crrnt_doctor.doc_no,
                        hsptl_no: widget.crrnt_doctor.hsptl_no!,
                        usr_no: AppCubit.get(context).usrNo,
                        book_for_you: 0,
                        ptn_no: 0,
                        pt_name: '',
                        pt_phone: '',
                        book_price: widget.crrnt_doctor.doc_price,
                        book_date: widget.crnt_date.toLocal().toString(),
                        book_time: widget.list_times[i].toString(),
                        date_enter: DateTime.now().toString(),
                      );
                      book.book_date = DateFormat('yyyy-MM-dd')
                          .format(DateTime.parse(book.book_date));
                      book.book_time = DateFormat.Hm()
                          .format(DateTime.parse(book.book_time));
                      i = 0;
                      Get.to(
                        () => BookPage(
                            crrnt_doctor: widget.crrnt_doctor, book: book),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: 100,
                    decoration: BoxDecoration(
                      color: ((list_int.length > 0 && list_int[i] == 0) ||
                              list_int.length == 0)
                          ? secondColor.withOpacity(0.7)
                          : textGrayColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(DateFormat.jm().format(widget.list_times[i])),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
