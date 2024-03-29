// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/backend/models/category.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/button_widget.dart';
import 'package:flutter_divar_clone/modules/advertising/controller/create_ads_controller.dart';
import 'package:get/get.dart';

import '../../../helpers/widgets/text_item_widget.dart';

class SelectCategoryBottomSheet extends StatelessWidget {
   SelectCategoryBottomSheet({super.key,required this.list});
  List<Category> list;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAdsController>(
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(Distance.bodyMargin),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            )
          ),
          width: double.infinity,
          child: Column(
            children: [
              const Text("انتخاب دسته بندی",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              const SizedBox(height: 16),
              // category list
              Expanded(child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return TextItemWidget(
                      onTap: () => controller.changeCategory(list[index]),
                      selected: list[index].id! == controller.selectedCategory?.id,
                      text: list[index].name!);
                },
              ),),
              ButtonWidget(
                  width: 160,
                  onTap: () => Get.back(),
                  text: "تایید")
            ],
          )
        );
      }
    );
  }
}


