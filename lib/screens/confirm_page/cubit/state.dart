part of 'cubit.dart';

abstract class ConfirmBookState {}

class ConfirmBookInitial extends ConfirmBookState {}

class BookSaving extends ConfirmBookState {}

class BookFailedSave extends ConfirmBookState {}

class BookErrorSave extends ConfirmBookState {}

class BookSuccessfullySave extends ConfirmBookState {}
