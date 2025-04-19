part of 'my_transaction_cubit.dart';

@immutable
abstract class MyTransactionState {}

class MyTransactionInitial extends MyTransactionState {}

class MyTransactionLoading extends MyTransactionState {}

class MyTransactionError extends MyTransactionState {}

class MyTransactionGet extends MyTransactionState {}
