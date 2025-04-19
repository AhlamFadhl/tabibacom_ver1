part of 'hospital_profile_cubit.dart';

abstract class HospitalProfileState {}

class HospitalProfileInitial extends HospitalProfileState {}

class HospitalProfileLoading extends HospitalProfileState {}

class HospitalProfileGet extends HospitalProfileState {}

class HospitalProfileError extends HospitalProfileState {}
