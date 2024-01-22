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
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent
    ),
    dividerColor: const Color(0xFFF1F1F1),
    useMaterial3: true,
    textTheme:  const TextTheme(
      bodyMedium: TextStyle(color: Color(0xFF1C1C1C))
    )
  );
}