import 'package:google_sheets_api_example/src/comman/models/create_sheet_dto.dart';
import 'package:google_sheets_api_example/src/comman/models/sheet_row.dart';

class SheetService {
  SheetService._();

  static Future<List<SheetRow>> findMany() async {
    throw UnimplementedError();
  }

  static Future<void> createOne(CreateSheetDto dto) async {
    throw UnimplementedError();
  }

  static Future<void> deleteOne(SheetRow row) async {
    throw UnimplementedError();
  }

  static Future<void> updateOne(SheetRow row) async {
    throw UnimplementedError();
  }
}
