part of 'cubit.dart';

@immutable
sealed class RegionState {}

final class RegionInitial extends RegionState {}

final class RegionLoading extends  RegionState {}
final class RegionGet extends  RegionState {}
final class RegionError extends  RegionState {}
