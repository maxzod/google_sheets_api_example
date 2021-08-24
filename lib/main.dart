import 'package:flutter/material.dart';
import 'package:google_sheets_api_example/src/comman/config/app.dart';

import 'src/modules/home/page.dart';

void main() {
  runApp(
    const MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}
