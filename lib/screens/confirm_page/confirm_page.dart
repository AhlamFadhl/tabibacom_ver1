import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tabibacom_ver1/models/book_model.dart';
import 'package:tabibacom_ver1/models/doctor_model.dart';
import 'package:tabibacom_ver1/screens/confirm_page/cubit/cubit.dart';
import 'package:tabibacom_ver1/shared/components/components.dart';
import 'package:tabibacom_ver1/shared/components/constants.dart';
import 'package:tabibacom_ver1/shared/styles/styles.dart';

class ConfirmPage extends StatelessWidget {
  ConfirmPage({required this.crnt_doctor, required this.book});
  Doctor crnt_doctor;
  BookModel book;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmBookCubit(),
      child: BlocConsumer<ConfirmBookCubit, ConfirmBookState>(
        listener: (context, state) {
          if (state is BookFailedSave) {
            showToast(text: 'حدث خطأ لم يتم الحجز', state: ToastStates.ERROR);
          } else if (state is BookSuccessfullySave) {
            showToast(text: 'تم الحجز', state: ToastStates.SUCCESS);
          }
        },
        builder: (context, state) {
          var cubit = ConfirmBookCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(title: Text('تأكيد الحجز')),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      if (cubit.isSaved && state is BookSuccessfullySave)
                        Container(
                          child: Image.asset(
                            'assets/images/check.png',
                            fit: BoxFit.contain,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        crnt_doctor.doc_first_name +
                            ' ' +
                            crnt_doctor.doc_last_name,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        crnt_doctor.hsptl_name ?? '',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        crnt_doctor.hsptl_address ?? '',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        DateFormat.yMMMd()
                            .format(DateTime.parse(book.book_date))
                            .toString(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        DateFormat.jm()
                            .format(
                                DateTime.parse("2023-01-01 " + book.book_time))
                            .toString(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          'طريقة الدفع',
                          textAlign: TextAlign.start,
                          style: styleHeadline,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: cubit.payNo,
                            onChanged: (val) {
                              cubit.changeRadioButton(val);
                            },
                          ),
                          Text(
                            'حاسب (الكريمي)',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: cubit.payNo,
                            onChanged: (val) {
                              cubit.changeRadioButton(val);
                            },
                          ),
                          Text(
                            'كاش باي',
                          ),
                        ],
                      ),
                      if (!cubit.isSaved)
                        state is BookSaving
                            ? CircularProgressIndicator()
                            : defaultButton(
                                function: () {
                                  cubit.insertBook(book);
                                },
                                text: 'تأكيد الحجز'),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
