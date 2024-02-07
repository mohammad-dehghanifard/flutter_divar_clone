import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/page_app_bar_widget.dart';
import 'package:flutter_divar_clone/helpers/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone/modules/advertising/widgets/create_ads_action_button.dart';

class AddNewAds extends StatelessWidget {
  const AddNewAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const PageAppBarWidget(name: "ایجاد آگهی"),
            Padding(
              padding: const EdgeInsets.all(Distance.bodyMargin),
              child: Form(
                  child: Column(
                    children: [
                      const TextFieldWidget(hintText: "عنوان آگهی را وارد کنید"),
                      const SizedBox(height: 12),
                      CreateAdsActionButton(
                        onTap: () {},
                        child: const Text("دسته بندی آگهی را انتخاب کنید",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF959595)),),
                      ),
                      const SizedBox(height: 12),
                      const TextFieldWidget(hintText: "توضیحات آگهی را وارد کنید",maxLine: 3),
                    ],
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}

