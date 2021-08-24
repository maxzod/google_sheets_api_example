part of 'insert_one_cubit_cubit.dart';

abstract class InsertOneCubitState {
  const InsertOneCubitState();
}

class InsertOneInitial extends InsertOneCubitState {}

class InsertOneLoading extends InsertOneCubitState {}

class InsertOneSuccess extends InsertOneCubitState {}

class InsertOneFailure extends InsertOneCubitState {
  final String msg;

  const InsertOneFailure(this.msg);
}
