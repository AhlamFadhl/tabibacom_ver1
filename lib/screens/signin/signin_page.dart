import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabibacom_ver1/models/users_model.dart';
import 'package:tabibacom_ver1/screens/signin/cubit/cubit.dart';
import 'package:tabibacom_ver1/shared/components/components.dart';
import 'package:tabibacom_ver1/shared/components/constants.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(),
      child: BlocConsumer<SigninCubit, SigninStates>(
        listener: (context, state) {
          if (state is SigninNewSucsses) {
            showToast(text: 'تم التسجيل بنجاح', state: ToastStates.SUCCESS);
            Navigator.pop(context);
          } else if (state is SigninSucsses) {
            showToast(text: 'تم الدخول بنجاح', state: ToastStates.SUCCESS);
            Navigator.pop(context);
          } else if (state is SigninNewFailed || state is SigninFailed) {
            showToast(
                text: 'تأكد من معلومات الدخول', state: ToastStates.WARNING);
          } else if (state is SigninError || state is SigninNewError) {
            showToast(text: 'حدث خطأ اثناء لدخول', state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          var cubit = SigninCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (cubit.register == 0)
                        Form(
                          key: cubit.formKeyPhone,
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'رقم الجوال',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              defaultFormField(
                                controller: cubit.controllerPhone,
                                type: TextInputType.phone,
                                validate: (value) {},
                                hinttxt: 'ادخل رقم الجوال',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      
                      if (cubit.register != 0)
                        Form(
                          key: cubit.formKeyPass,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'كلمة السر',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              defaultFormField(
                                controller: cubit.controllerPass,
                                type: TextInputType.phone,
                                validate: (value) {},
                                hinttxt: 'ادخل كلمة السر',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      if (cubit.register == 0)
                        ConditionalBuilder(
                          condition: state is SigninCheckingPhone,
                          builder: (context) => CircularProgressIndicator(),
                          fallback: (context) => defaultButton(
                              function: () {
                                if (cubit.formKeyPhone.currentState!
                                    .validate()) {
                                  cubit.Login_register(
                                      cubit.controllerPhone.text);
                                }
                              },
                              text: 'موافق'),
                        ),
                      if (cubit.register != 0)
                        ConditionalBuilder(
                          condition: ((state is SigninLoading) &&
                              (state is SigninNewLoading)),
                          builder: (context) => CircularProgressIndicator(),
                          fallback: (context) => defaultButton(
                              function: () {
                                if (cubit.register == 1) {
                                  if (cubit.formKeyPass.currentState!
                                      .validate()) {
                                    cubit.Login_User(cubit.controllerPhone.text,
                                        cubit.controllerPass.text, context);
                                  }
                                } else {
                                  if (cubit.formKeyPass.currentState!
                                          .validate() &&
                                      cubit.formKeyName.currentState!
                                          .validate()) {
                                    Users usr = Users(
                                      usr_no: 0,
                                      usr_name: cubit.controllerName.text,
                                      usr_phone: cubit.controllerPhone.text,
                                      usr_pass: cubit.controllerPass.text,
                                      usr_doctor: 0,
                                      usr_email: '',
                                      usr_google: 0,
                                      usr_hsptl: 0,
                                      usr_type: 0,
                                    );
                                    cubit.Register_User(usr, context);
                                  }
                                }
                              },
                              text: 'دخول'),
                        ),
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
