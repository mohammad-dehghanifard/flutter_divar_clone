import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/button_widget.dart';
import 'package:flutter_divar_clone/helpers/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone/modules/auth/controller/register_controller.dart';
import 'package:flutter_divar_clone/modules/auth/pages/login_page.dart';
import 'package:flutter_divar_clone/modules/auth/widgets/auth_page_app_bar_widget.dart';
import 'package:flutter_divar_clone/modules/auth/widgets/auth_page_footer_widget.dart';
import 'package:flutter_divar_clone/modules/auth/widgets/province_and_city_dialog.dart';
import 'package:flutter_divar_clone/modules/auth/widgets/select_province_and_city_button.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // app bar
              const AuthPageAppBarWidget(title: "ثبت نام" ),
              Padding(
                padding: const EdgeInsets.all(Distance.bodyMargin),
                child: GetBuilder<RegisterController>(
                  init: RegisterController(),
                  builder: (controller) {
                    return Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          // full name
                          TextFieldWidget(
                              controller: controller.fullNameText,
                              hintText: "نام و نام خانوادگی",
                              validator: controller.validateFullNameForm,
                              icon: Iconsax.user),
                          const SizedBox(height: 12),
                          // phone number
                          TextFieldWidget(
                              controller: controller.phoneNumberText,
                              validator: controller.validatePhoneNumberForm,
                              hintText: "شماره موبایل",
                              icon: Iconsax.mobile,type: TextInputType.phone),
                          const SizedBox(height: 12),
                          // select province and city
                          Row(
                            children: [
                              Expanded(
                                  child: SelectProvinceAndCityButton(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                        return const ProvinceAndCityDialog();
                                      },);
                                    },
                                    text: "استان",)),
                              const SizedBox(width: 24),
                              Expanded(
                                  child: SelectProvinceAndCityButton(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const ProvinceAndCityDialog();
                                    },);
                                } ,
                                text: "شهر",))
                            ],
                          ),
                          const SizedBox(height: 12),
                          TextFieldWidget(
                              validator: controller.validateAddressForm,
                              controller: controller.addressText,
                              hintText: "آدرس خود را وارد کنید",
                              maxLine: 3),
                          const SizedBox(height: 12),
                          // password and repeat pass word
                          TextFieldWidget(
                              hintText: "رمز عوبر",
                              validator: controller.validatePasswordForm,
                              controller: controller.passwordText,
                            type: TextInputType.visiblePassword),
                          const SizedBox(height: 12),
                          TextFieldWidget(
                            controller: controller.repeatPasswordText,
                              validator: controller.validateRepeatPasswordForm,
                              hintText: "تکرار رمز عبور",
                              type: TextInputType.visiblePassword),
                          const SizedBox(height: 32),
                          // register button
                          ButtonWidget(
                              onTap: controller.register,
                              height: 50,
                              text: "ثبت نام"),
                          const SizedBox(height: 18),
                          AuthFooterWidget(
                            onTap: () => Get.off(const LoginPage()),
                            text:"حساب کاربری دارید؟",
                            buttonText: "وارد شوید",
                          )
                        ],
                      ),
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}








