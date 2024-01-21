import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/modules/auth/widgets/auth_page_app_bar_widget.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // app bar
            AuthPageAppBarWidget(title: "ثبت نام" ),
          ],
        ),
      ),
    );
  }
}


