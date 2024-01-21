import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/button_widget.dart';
import 'package:flutter_divar_clone/helpers/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone/modules/auth/pages/register_page.dart';
import 'package:flutter_divar_clone/modules/auth/widgets/auth_page_app_bar_widget.dart';
import 'package:flutter_divar_clone/modules/auth/widgets/auth_page_footer_widget.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
         children: [
           // app bar
            const AuthPageAppBarWidget(title: "ورود"),
           Padding(
             padding: const EdgeInsets.all(Distance.bodyMargin),
             child: SingleChildScrollView(
               child: Column(
                 children: [
                   // phone number
                   const TextFieldWidget(hintText: "شماره موبایل",icon: Iconsax.mobile),
                   const SizedBox(height: 12),
                   // pass word
                   const TextFieldWidget(hintText: "رمز عوبر",
                       icon: CupertinoIcons.eye,
                       type: TextInputType.visiblePassword),
                   const SizedBox(height: 12),
                   // register button
                   ButtonWidget(
                       onTap: () {},
                       height: 50,
                       text: "ثبت نام"),
                   const SizedBox(height: 18),
                   AuthFooterWidget(
                     onTap: () => Get.off(const RegisterPage()),
                     text:"حساب کاربری ندارید؟",
                     buttonText: "ثبت نام کنید",
                   )
                 ],
               ),
             ),
           )
         ],
        ),
      ),
    );
  }
}
