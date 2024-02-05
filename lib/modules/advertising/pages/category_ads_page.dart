import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/loading_widget.dart';
import 'package:flutter_divar_clone/helpers/widgets/page_app_bar_widget.dart';
import 'package:flutter_divar_clone/modules/advertising/controller/category_controller.dart';
import 'package:flutter_divar_clone/modules/advertising/widgets/ads_list_item_widget.dart';
import 'package:get/get.dart';

class CategoryAdsPage extends StatelessWidget {
  CategoryAdsPage({super.key, required this.id, required this.name}){
    Get.find<CategoryController>().fetchAdsByCategoryId(id);
  }
  final int id;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<CategoryController>(
          builder: (controller) {
            return Column(
              children: [
                PageAppBarWidget(name: "دسته بندی $name"),
                controller.adsList == null? LoadingWidget(color: Theme.of(context).colorScheme.primary,)
                    :Expanded(
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
      ),
    );
  }
}


