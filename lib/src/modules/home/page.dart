import 'package:flutter/material.dart';
import 'package:google_sheets_api_example/src/comman/config/app.dart';
import 'package:google_sheets_api_example/src/modules/insert_form/page.dart';
import 'package:google_sheets_api_example/src/modules/sheet_rows/page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void to(Widget page, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home ♥'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppConfig.splashImage),
            OutlinedButton(
              onPressed: () => to(const InsertFormPage(), context),
              child: const Text('insert'),
            ),
            OutlinedButton(
              onPressed: () => to(const SheetRowsPage(), context),
              child: const Text('show data'),
            ),
          ],
        ),
      ),
    );
  }
}
