import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/button_widget.dart';
import 'package:flutter_divar_clone/helpers/widgets/loading_widget.dart';
import 'package:flutter_divar_clone/helpers/widgets/page_app_bar_widget.dart';
import 'package:flutter_divar_clone/helpers/widgets/show_snack_bar.dart';
import 'package:flutter_divar_clone/helpers/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone/modules/advertising/controller/create_ads_controller.dart';
import 'package:flutter_divar_clone/modules/advertising/widgets/create_ads_action_button.dart';
import 'package:flutter_divar_clone/modules/advertising/widgets/select_category_bottom_sheet_widget.dart';
import 'package:flutter_divar_clone/modules/advertising/widgets/select_city_bottom_sheet.dart';
import 'package:flutter_divar_clone/modules/advertising/widgets/select_image_bottom_sheet.dart';
import 'package:flutter_divar_clone/modules/advertising/widgets/select_perovince_bottom_sheet.dart';
import 'package:flutter_divar_clone/modules/auth/widgets/select_province_and_city_button.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAds extends StatelessWidget {
  const AddNewAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<CreateAdsController>(
            init: CreateAdsController(),
            builder: (controller) {
              return Column(
                children: [
                  const PageAppBarWidget(name: "ایجاد آگهی"),
                  Padding(
                    padding: const EdgeInsets.all(Distance.bodyMargin),
                    child: Form(
                        child: controller.provinceResponse == null || controller.categoryResponse == null ?
                        LoadingWidget(color: Theme.of(context).colorScheme.primary)
                            : Column(
                          children: [
                            // title
                            const TextFieldWidget(hintText: "عنوان آگهی را وارد کنید"),
                            const SizedBox(height: 12),
                            // setCategory
                            CreateAdsActionButton(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>  SelectCategoryBottomSheet(list: controller.categoryResponse!.data!));
                              },
                              child:  Text(
                                controller.selectedCategory == null? "دسته بندی آگهی را انتخاب کنید" : controller.selectedCategory!.name!,
                                style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF959595)),),
                            ),
                            const SizedBox(height: 12),
                            // description
                            const TextFieldWidget(hintText: "توضیحات آگهی را وارد کنید",maxLine: 3),
                            const SizedBox(height: 12),
                            // price
                            const TextFieldWidget(hintText: "قیمت آگهی را وارد کنید",type: TextInputType.number),
                            const SizedBox(height: 12),
                            // set image
                            CreateAdsActionButton(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder:(context) => const SelectImageBottomSheet(),
                                );
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("تصویر آگهی را انتخاب کنید",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF959595)),),
                                  Icon(Iconsax.gallery,color: Color(0xFF959595))
                                ],
                              )
                            ),
                            const SizedBox(height: 12),
                            // province and city
                            Row(
                              children: [
                                // select province
                                Expanded(child: SelectProvinceAndCityButton(
                                  text: controller.selectedProvince == null? "استان" : controller.selectedProvince!.name!,
                                  onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) =>  SelectProvinceBottomSheet(list: controller.provinceResponse!.provinceList!));
                                },)),
                                const SizedBox(width: 16),
                                // select city
                                Expanded(child: SelectProvinceAndCityButton(
                                  text: controller.selectCity == null ?"شهر" : controller.selectCity!.name!,
                                  onTap: () {
                                  if(controller.selectedProvince == null){
                                    showSnackBar(message: "لطفا ابتدا یک استان انتخاب کنید", type: SnackBarType.error);
                                  }else {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) =>  SelectCityBottomSheet(list: controller.selectedProvince!.cities!));
                                  }
                                },)),
                              ],
                            ),
                            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                            // create ads btn
                            ButtonWidget(
                                onTap: () {},
                                text: 'ثبت آگهی')
                          ],
                        )
                    ),
                  )
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}

