import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone/modules/advertising/controller/search_controller.dart';
import 'package:flutter_divar_clone/modules/advertising/widgets/ads_list_item_widget.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Distance.bodyMargin),
      child:  GetBuilder<AdsSearchController>(
        init: AdsSearchController(),
        builder: (controller) {
          return Column(
            children: [
              // search text field
              TextFieldWidget(
                controller: controller.searchText,
                onChange: (value) => controller.searchAdsResult(),
                hintText: "آگهی مورد نظر خود را جستجو کنید",
                icon: Iconsax.search_normal,
                iconColor: Theme.of(context).colorScheme.primary,
              ),
              // ads list
              controller.adsList == null? const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search,size: 145,color: Colors.red),
                    Text("آگهی مورد نظرت رو سرچ کن تا زودتر پیداش کنی!")
                  ],
                ),
              ) :Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(Distance.bodyMargin),
                    itemCount: controller.adsList!.length,
                    itemBuilder: (context, index) {
                      final ads =  controller.adsList![index];
                      return AdsListItemWidget(ads: ads);
                    },
                  )
              )
            ],
          );
        }
      ),
    );
  }
}
