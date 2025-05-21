part of 'cubit.dart';

sealed class HospitalDoctorsState {}

final class HospitalDoctorsInitial extends HospitalDoctorsState {}
final class HospitalLoadingState extends HospitalDoctorsState {}

final class HospitalDoctorsGetState extends HospitalDoctorsState {}
final class HospitalDoctorsLoadingState extends HospitalDoctorsState {}
final class HospitalDoctorsErrorState extends HospitalDoctorsState {}
