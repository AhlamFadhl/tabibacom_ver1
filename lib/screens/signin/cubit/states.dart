part of 'cubit.dart';

@immutable
abstract class SigninStates {}

class SigninInitial extends SigninStates {}

class SigninCheckingPhone extends SigninStates {}

class SigninCheckPhoneDone extends SigninStates {}

class SigninCheckPhoneFailed extends SigninStates {}

class SigninLoading extends SigninStates {}

class SigninSucsses extends SigninStates {}

class SigninFailed extends SigninStates {}

class SigninError extends SigninStates {}

class SigninNewLoading extends SigninStates {}

class SigninNewSucsses extends SigninStates {}

class SigninNewFailed extends SigninStates {}

class SigninNewError extends SigninStates {}
