import 'package:flutter/material.dart';
import 'package:test_auth_pin_app/injection/init_get.dart' as injection;

import 'presentation/pin_page/pin_page.dart';

void main() {
  injection.configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PinPage(),
    );
  }
}
