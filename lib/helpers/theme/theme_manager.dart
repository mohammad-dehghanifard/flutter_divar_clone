import 'package:flutter/material.dart';

class ThemeManager {
  ThemeManager._();

  static ThemeData lightMode = ThemeData(
    fontFamily: 'yekanBakh',
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFD91313),
      background: Color(0xFFF5F5F5),
      onPrimary: Color(0xFFFFFFFF)
    ),
    useMaterial3: true,
    textTheme: const TextTheme(
      bodyMedium: TextStyle()
    )
  );
}