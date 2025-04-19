import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tabibacom_ver1/models/users_model.dart';
import 'package:tabibacom_ver1/shared/cubit/cubit.dart';
import 'package:tabibacom_ver1/shared/network/end_points.dart';
import 'package:tabibacom_ver1/shared/network/remote/dio_helper.dart';

part 'states.dart';

class SigninCubit extends Cubit<SigninStates> {
  SigninCubit() : super(SigninInitial());
  static SigninCubit get(context) => BlocProvider.of(context);

  var controllerName = TextEditingController();
  var controllerPhone = TextEditingController();
  var controllerPass = TextEditingController();

  var formKeyPhone = GlobalKey<FormState>();
  var formKeyPass = GlobalKey<FormState>();
  var formKeyName = GlobalKey<FormState>();
  int register = 0;
  Users? user;

  Login_register(String phone) {
    emit(SigninCheckingPhone());
    DioHelper.postData(url: USER_PHONE, data: {'usr_phone': phone})
        .then((value) {
      print(value.data['status']);
      register = value.data['status'];
      emit(SigninCheckPhoneDone());
    }).catchError((error) {
      print(error);
      emit(SigninCheckPhoneFailed());
    });
  }

  Login_User(String phone, String pass, context) {
    emit(SigninLoading());
    DioHelper.postData(
        url: USER_LOGIN,
        data: {'usr_phone': phone, 'usr_pass': pass}).then((value) {
      print(value.data['status']);
      if (value.data['status'] == 1) {
        user = Users.fromJson(value.data['user']);
        if (user != null) {
          AppCubit.get(context).usrNo = user!.usr_no;
          AppCubit.get(context).usrName = user!.usr_name;
          AppCubit.get(context).usrPhone = user!.usr_phone;
          AppCubit.get(context).saveUserSignIn();
        }
        emit(SigninSucsses());
      } else {
        emit(SigninFailed());
      }
    }).catchError((error) {
      print(error);
      emit(SigninError());
    });
  }

  Register_User(Users usr, context) {
    emit(SigninNewLoading());
    DioHelper.postData(url: USER_NEW, data: usr.toJson()).then((value) {
      print(value.data['status']);
      if (value.data['status'] == 1) {
        user = Users.fromJson(value.data['user']);
        if (user != null) {
          AppCubit.get(context).usrNo = user!.usr_no;
          AppCubit.get(context).usrName = user!.usr_name;
          AppCubit.get(context).usrPhone = user!.usr_phone;
          AppCubit.get(context).saveUserSignIn();
        }
        emit(SigninNewSucsses());
      } else {
        emit(SigninNewFailed());
      }
    }).catchError((error) {
      print(error);
      emit(SigninNewError());
    });
  }
}
