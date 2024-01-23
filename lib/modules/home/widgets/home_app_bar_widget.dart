import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'app_bar_button.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 15,
              offset: const Offset(0,3)
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBarButton(onTap: () {},icon: Iconsax.sort,text: "جدیدترین"),
          Text(title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
          AppBarButton(onTap: () {},icon: Iconsax.location,text: "بوشهر"),
        ],
      ),
    );
  }
}