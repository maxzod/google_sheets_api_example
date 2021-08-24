import 'package:flutter/material.dart';
import 'package:google_sheets_api_example/src/comman/models/sheet_row.dart';

class RowItemCard extends StatelessWidget {
  final SheetRow row;
  const RowItemCard(this.row, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(row.name),
      ),
    );
  }
}
