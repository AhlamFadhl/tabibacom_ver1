import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'state.dart';

class SplashCubit extends Cubit<SplashStates> {
  SplashCubit() : super(SplashInitial());
  static SplashCubit get(context) => BlocProvider.of(context);

  getEnternetData() {
    emit(SplashLoadingEnternetState());
    Future.delayed(Duration(seconds: 5)).then((value) {
      emit(SplashNotEnternetState());
    });
  }
}
