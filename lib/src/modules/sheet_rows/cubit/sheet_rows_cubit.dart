import 'package:bloc/bloc.dart';
import 'package:google_sheets_api_example/src/comman/models/sheet_row.dart';
import 'package:google_sheets_api_example/src/comman/services/sheet_service.dart';

part 'sheet_rows_state.dart';

class SheetRowsCubit extends Cubit<SheetRowsState> {
  SheetRowsCubit() : super(SheetRowsLoading()) {
    refresh();
  }

  Future<void> refresh() async {
    try {
      emit(SheetRowsLoading());
      final rows = await SheetService.findMany();
      emit(SheetRowsLoaded(rows));
    } catch (e) {
      emit(SheetRowsFailure(e.toString()));
    }
  }
}
