import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/backend/models/category.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/resources/load_network_image.dart';
import 'package:flutter_divar_clone/modules/advertising/pages/category_ads_page.dart';
import 'package:get/get.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.category
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(CategoryAdsPage(id: category.id!,name: category.name!,)),
      child: Container(
        margin: const EdgeInsets.only(bottom: Distance.bodyMargin),
        padding: const EdgeInsets.all(12),
        width: MediaQuery.sizeOf(context).width,
        height: 48,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 10,offset: const Offset(0,3)
              )
            ],
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            // category image
            LoadNetworkImage(imageUrl: category.image!),
            const SizedBox(width: 8),
            // category name
            Text(category.name!,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w700)),
            const Spacer(),

            const Icon(CupertinoIcons.right_chevron)
          ],
        ),
      ),
    );
  }
}