import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:tabibacom_ver1/models/book_model.dart';
import 'package:tabibacom_ver1/shared/cubit/cubit.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/network/remote/dio_helper.dart';

part 'states.dart';

class BookCubit extends Cubit<BookStates> {
  BookCubit() : super(BookInitial());
  static BookCubit get(context) => BlocProvider.of(context);

  bool book_for_another = false;
  changeBookForAnother(value, context) {
    book_for_another = value;
    if (value) {
      enabledName = true;
      enabledPhone = true;
      getText('', '');
    } else {
      enabledName = false;
      enabledPhone = false;
      getText(AppCubit.get(context).usrPhone, AppCubit.get(context).usrName);
    }
    emit(BookChangeCheck());
  }

  getText(String phone, String name) {
    controllerName.text = name;
    controllerPhone.text = phone;
  }

  var formKey = GlobalKey<FormState>();
  var controllerName = TextEditingController();
  var controllerPhone = TextEditingController();

  bool enabledName = false;
  bool enabledPhone = false;
}
