import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tabibacom_ver1/models/book_model.dart';
import 'package:tabibacom_ver1/models/doctor_model.dart';
import 'package:tabibacom_ver1/screens/book_page/cubit/cubit.dart';
import 'package:tabibacom_ver1/screens/confirm_page/confirm_page.dart';
import 'package:tabibacom_ver1/shared/components/components.dart';
import 'package:tabibacom_ver1/shared/components/constants.dart';
import 'package:tabibacom_ver1/shared/cubit/cubit.dart';

class BookPage extends StatelessWidget {
  Doctor crrnt_doctor;
  BookModel book;
  BookPage({required this.crrnt_doctor, required this.book});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookCubit()
        ..getText(
          AppCubit.get(context).usrPhone,
          AppCubit.get(context).usrName,
        ),
      child: BlocConsumer<BookCubit, BookStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BookCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'بيانات الحجز',
              ),
            ),
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildDoctorItem_Top(crrnt_doctor),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(child: Icon(Icons.person)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'معلومات الأساسية',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Form(
                            key: cubit.formKey,
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: cubit.book_for_another,
                                        onChanged: (value) {
                                          cubit.changeBookForAnother(
                                              value, context);
                                        },
                                      ),
                                      Text(
                                        'الحجز لشخص آخر',
                                      ),
                                    ],
                                  ),
                                  Text('اسم المريض'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: defaultFormField(
                                        isClickable: cubit.enabledName,
                                        controller: cubit.controllerName,
                                        type: TextInputType.text,
                                        validate: (value) {
                                          if (cubit.book_for_another) {
                                            if (value.toString().isEmpty)
                                              return 'ادخل اسم لمريض';
                                          }
                                          return null;
                                        },
                                        hinttxt: 'اسم المريض'),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text('رقم المريض'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: defaultFormField(
                                        isClickable: cubit.enabledPhone,
                                        controller: cubit.controllerPhone,
                                        type: TextInputType.phone,
                                        validate: (value) {
                                          if (cubit.book_for_another) {
                                            if (value.toString().isEmpty)
                                              return 'ادخل رقم لمريض';
                                          }
                                          return null;
                                        },
                                        hinttxt: 'رقم المريض'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    /////
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.watch_later),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'الموعد',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat.jm().format(DateTime.parse(
                                      "2023-01-01 " + book.book_time)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  DateFormat.yMMMd()
                                      .format(DateTime.parse(book.book_date)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    ////////

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.monetization_on_rounded),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'الرسوم',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  crrnt_doctor.doc_price.toString(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    /////////////

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.info),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'ملاحظة',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  crrnt_doctor.doc_note ?? '',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ///////
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: defaultButton(
                          function: () {
                            if (cubit.formKey.currentState!.validate()) {
                              book.book_for_you =
                                  cubit.book_for_another ? 0 : 1;

                              book.pt_name = cubit.controllerName.text;
                              book.pt_phone = cubit.controllerPhone.text;
                              navigateTo(
                                  context,
                                  ConfirmPage(
                                      crnt_doctor: crrnt_doctor, book: book));
                            }
                          },
                          text: 'حجز'),
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
}
