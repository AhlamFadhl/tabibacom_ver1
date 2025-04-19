import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tabibacom_ver1/models/book_model.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/network/remote/dio_helper.dart';

part 'my_transaction_state.dart';

class MyTransactionCubit extends Cubit<MyTransactionState> {
  MyTransactionCubit() : super(MyTransactionInitial());
  static MyTransactionCubit get(context) => BlocProvider.of(context);

  List<BookModel> list_book = [];
  getLastBooks(user) {
    list_book = [];
    if (user != 0) {
      emit(MyTransactionLoading());
      DioHelper.postData(url: BOOK_USER, data: {'user': user}).then((value) {
        print(value);
        List<dynamic> list = value.data;
        list_book = list.map((json) => BookModel.fromJson(json)).toList();
        emit(MyTransactionGet());
      }).then((value) {
        print(value);
        emit(MyTransactionError());
      });
    }
  }
}
