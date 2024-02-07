// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/backend/models/city.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/button_widget.dart';
import 'package:flutter_divar_clone/modules/advertising/controller/create_ads_controller.dart';
import 'package:flutter_divar_clone/modules/advertising/widgets/text_item_widget.dart';
import 'package:get/get.dart';


class SelectCityBottomSheet extends StatelessWidget {
  SelectCityBottomSheet({super.key,required this.list});
  List<City> list;
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
                  const Text("انتخاب استان",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                  const SizedBox(height: 16),
                  // category list
                  Expanded(child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return TextItemWidget(
                        text: list[index].name!,
                        selected: list[index].id! == controller.selectCity?.id,
                        onTap: () => controller.changeCity(list[index]),);
                    },
                  ),),
                  const SizedBox(height: 8),
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


