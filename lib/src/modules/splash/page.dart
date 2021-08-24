import 'package:flutter/material.dart';
import 'package:google_sheets_api_example/src/comman/config/app.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: Image.asset(AppConfig.splashImage),
        ),
      ),
    );
  }
}
