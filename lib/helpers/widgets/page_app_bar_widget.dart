import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PageAppBarWidget extends StatelessWidget {
  const PageAppBarWidget({
    super.key, required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 15,offset: const Offset(0,3)
          )
        ],
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(name,style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 18)),
          const Spacer(),
          IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Iconsax.arrow_left,color: Theme.of(context).colorScheme.primary,)
          )
        ],
      ),
    );
  }
}