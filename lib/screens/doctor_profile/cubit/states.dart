part of 'cubit.dart';

@immutable
abstract class DoctorProfileStates {}

class DoctorProfileInitial extends DoctorProfileStates {}

class DoctorProfileLoading extends DoctorProfileStates {}

class DoctorProfileGet extends DoctorProfileStates {}

class DoctorProfileError extends DoctorProfileStates {}
