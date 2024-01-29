import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'filter_menu_item.dart';

class AdsFilterMenuWidget extends StatelessWidget {
   AdsFilterMenuWidget({super.key});
  final  homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Sort>(
      onSelected: (value) => homeController.sortAds(value),
      icon: Column(
        children: [
          Icon(Iconsax.sort,color: Theme.of(context).colorScheme.primary),
          Text("جدیدترین ها",style: TextStyle(fontSize: 12,color: Theme.of(context).colorScheme.primary),)
        ],
      ),
      position: PopupMenuPosition.under,
      color: Colors.white,
      surfaceTintColor: Colors.transparent,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        itemBuilder: (context) {
         return [
           // جدیدترین
           PopupMenuItem<Sort>(
               value: Sort(orderBy: 'id',orderType: "DESC"),
               child: const FilterMenuItem(title: "جدیدترین ها",)),
           // قدیمی ترین
           PopupMenuItem(
               value: Sort(orderBy: 'id',orderType: "ASC"),
               child: const FilterMenuItem(title: "قدیمی ترین")),
           // گران ترین
           PopupMenuItem(
               value: Sort(orderBy: 'price',orderType: "DESC"),
               child: const FilterMenuItem(title: "گران ترین")),
           // ارزان ترین
           PopupMenuItem(
               value: Sort(orderBy: 'price',orderType: "ASC"),
               child: const FilterMenuItem(title: "ارزان ترین",showBorder: false)),
         ] ;
        },
    );
  }
}


