part of 'sheet_rows_cubit.dart';

abstract class SheetRowsState {
  const SheetRowsState();
}

class SheetRowsLoading extends SheetRowsState {}

class SheetRowsLoaded extends SheetRowsState {
  final List<SheetRow> rows;

  SheetRowsLoaded(this.rows);
}

class SheetRowsFailure extends SheetRowsState {
  final String msg;

  SheetRowsFailure(this.msg);
}
