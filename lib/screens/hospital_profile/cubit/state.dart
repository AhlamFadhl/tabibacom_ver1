part of 'cubit.dart';

abstract class HospitalProfileState {}

class HospitalProfileInitial extends HospitalProfileState {}

class HospitalProfileLoading extends HospitalProfileState {}

class HospitalProfileGet extends HospitalProfileState {}

class HospitalProfileError extends HospitalProfileState {}

class HospitalCategoryLoading extends HospitalProfileState {}

class HospitalCategoryGet extends HospitalProfileState {}

class HospitalCategoryError extends HospitalProfileState {}

class HospitalInsuranceLoading extends HospitalProfileState {}

class HospitalInsuranceGet extends HospitalProfileState {}

class HospitalInsuranceError extends HospitalProfileState {}
