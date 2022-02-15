import 'package:flutter/material.dart';

class AppColors {
  static const iconColor = Color.fromRGBO(0, 0, 0, 0.6);
  static pinIndicatorColor(bool isNotEmpty) =>
      isNotEmpty ? Colors.blue : Colors.transparent;
}
