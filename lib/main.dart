import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/theme/theme_manager.dart';
import 'package:flutter_divar_clone/modules/auth/pages/splash_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Divar Clone',
      locale: const Locale("fa"),
      theme: ThemeManager.lightMode,
      home: const SplashPage(),
    );
  }
}
