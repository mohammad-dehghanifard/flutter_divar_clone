import 'package:flutter/material.dart';

class ThemeManager {
  ThemeManager._();
  
  static ThemeData lightMode = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFD91313),
      background: Color(0xFFF5F5F5)
    ),
    useMaterial3: true,
  );
}