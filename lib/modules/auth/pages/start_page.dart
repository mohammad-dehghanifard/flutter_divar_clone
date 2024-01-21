import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/button_widget.dart';
import 'package:flutter_divar_clone/modules/auth/pages/register_page.dart';
import 'package:get/get.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Distance.bodyMargin,vertical: Distance.bodyMargin * 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // app name and welcome message
              Text("اپلیکیشن آگهی هیتال", style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 26, color: Theme
                  .of(context)
                  .colorScheme
                  .primary)),
              const SizedBox(height: 12),
              const Text("به اپلیکیشن آگهی هیتال خوش آمدید", style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xFF464646))),
              const Spacer(),
              // register button
              ButtonWidget(
                  onTap:( ) => Get.to(const RegisterPage()),
                  text: "ثبت نام"),
              const SizedBox(height: 12),
              // login
              ButtonWidget(
                  onTap: () {},
                  filled: false,
                  text: "ورود")
            ],
          ),
        ),
      ),
    );
  }
}
