import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibacom_ver1/models/book_model.dart';

import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/network/remote/dio_helper.dart';

part 'state.dart';

class ConfirmBookCubit extends Cubit<ConfirmBookState> {
  ConfirmBookCubit() : super(ConfirmBookInitial());
  static ConfirmBookCubit get(context) => BlocProvider.of(context);

  bool isSaved = false;
  int payNo = 1;
  insertBook(BookModel book) {
    emit(BookSaving());
    /* book.book_time =
        DateFormat.Hms().format(DateTime.parse(book.book_time)).toString();*/
    DioHelper.postData(url: BOOK_NEW, data: book.toJson()).then((value) {
      print(value);
      if (value.data['status'] == 1) {
        isSaved = true;
        emit(BookSuccessfullySave());
      } else {
        isSaved = false;
        emit(BookFailedSave());
      }
    }).catchError((error) {
      isSaved = false;
      print(error);
      emit(BookErrorSave());
    });
  }

  changeRadioButton(val) {
    payNo = val;
    emit(state);
  }
}
