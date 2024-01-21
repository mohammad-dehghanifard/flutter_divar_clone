import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/button_widget.dart';
import 'package:flutter_divar_clone/helpers/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone/modules/auth/widgets/auth_page_app_bar_widget.dart';
import 'package:flutter_divar_clone/modules/auth/widgets/auth_page_footer_widget.dart';
import 'package:flutter_divar_clone/modules/auth/widgets/select_province_and_city_button.dart';
import 'package:iconsax/iconsax.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // app bar
            const AuthPageAppBarWidget(title: "ثبت نام" ),
            Padding(
              padding: const EdgeInsets.all(Distance.bodyMargin),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // full name
                    const TextFieldWidget(hintText: "نام و نام خانوادگی",icon: Iconsax.user),
                    const SizedBox(height: 12),
                    // phone number
                    const TextFieldWidget(hintText: "شماره موبایل",icon: Iconsax.mobile,type: TextInputType.phone),
                    const SizedBox(height: 12),
                    // select province and city
                    Row(
                      children: [
                        Expanded(child: SelectProvinceAndCityButton(onTap: () {} ,text: "استان",)),
                        const SizedBox(width: 24),
                        Expanded(child: SelectProvinceAndCityButton(onTap: () {} ,text: "شهر",))
                      ],
                    ),
                    const SizedBox(height: 12),
                    const TextFieldWidget(hintText: "آدرس خود را وارد کنید",maxLine: 3),
                    const SizedBox(height: 12),
                    // password and repeat pass word
                    const TextFieldWidget(hintText: "رمز عوبر",
                      icon: CupertinoIcons.eye,
                      type: TextInputType.visiblePassword),
                    const SizedBox(height: 12),
                    const TextFieldWidget(hintText: "تکرار رمز عبور",
                        icon: CupertinoIcons.eye,
                        type: TextInputType.visiblePassword),
                    const SizedBox(height: 32),
                    // register button
                    ButtonWidget(
                        onTap: () {},
                        height: 50,
                        text: "ثبت نام"),
                    const SizedBox(height: 18),
                    AuthFooterWidget(
                      onTap: () {},
                      text:"حساب کاربری دارید؟",
                      buttonText: "وارد شوید",
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








