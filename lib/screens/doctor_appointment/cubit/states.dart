part of 'cubit.dart';

abstract class BookAppointmentStates {}

class BookAppointmentInitial extends BookAppointmentStates {}

class BookAppointmentLoading extends BookAppointmentStates {}

class BookAppointmentGet extends BookAppointmentStates {}

class BookAppointmentError extends BookAppointmentStates {}
