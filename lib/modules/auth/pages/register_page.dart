import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone/modules/auth/widgets/auth_page_app_bar_widget.dart';
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
              child: Column(
                children: [
                  const TextFieldWidget(hintText: "نام و نام خانوادگی",icon: Iconsax.user),
                  const SizedBox(height: 12),
                  const TextFieldWidget(hintText: "شماره موبایل",icon: Iconsax.mobile,type: TextInputType.phone),
                  const SizedBox(height: 12),
                  // select province and city
                  Row(
                    children: [
                      Expanded(child: SelectProvinceAndCityButton(onTap: () {} ,text: "استان",)),
                      const SizedBox(width: 24),
                      Expanded(child: SelectProvinceAndCityButton(onTap: () {} ,text: "شهر",))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}






