part of 'cubit.dart';

@immutable
sealed class InsuranceState {}

final class InsuranceInitial extends InsuranceState {}
final class InsuranceLoading extends  InsuranceState {}
final class InsuranceGet extends  InsuranceState {}
final class InsuranceError extends  InsuranceState {}


