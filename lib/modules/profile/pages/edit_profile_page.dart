import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/button_widget.dart';
import 'package:flutter_divar_clone/helpers/widgets/page_app_bar_widget.dart';
import 'package:flutter_divar_clone/helpers/widgets/select_province_and_city_button.dart';
import 'package:flutter_divar_clone/helpers/widgets/text_field_widget.dart';
import 'package:iconsax/iconsax.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const PageAppBarWidget(name: 'ویرایش پروفایل'),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Distance.bodyMargin),
                child: Column(
                  children: [
                    // profile image
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFECECEC))
                      ),
                      child: const Icon(Iconsax.gallery,color: Color(0xFF959595),),
                    ),
                    // change avatar btn
                    TextButton(
                        onPressed: () {},
                        child: const Text("انتخاب عکس پروفایل",style: TextStyle(color: Color(0xFF959595)))),
                    // name and lastname text field
                    const TextFieldWidget(hintText: 'نام و نام خانوادگی'),
                    const SizedBox(height: 12),
                    // city and province
                    Row(
                      children: [
                        Expanded(child: SelectProvinceAndCityButton(onTap: () {},text: "استان",)),
                        const SizedBox(width: 12),
                        Expanded(child: SelectProvinceAndCityButton(onTap: () {},text: "شهر",)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // address text field
                    const TextFieldWidget(
                        maxLine: 3,
                        hintText: 'آدرس'
                    ),
                    const SizedBox(height: 12),
                    // edit Button
                    ButtonWidget(
                        onTap: () {},
                        radius: 8,
                        text: 'ویرایش'
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
