// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/modules/advertising/controller/create_ads_controller.dart';
import 'package:flutter_divar_clone/modules/advertising/widgets/select_image_button.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class SelectImageBottomSheet extends StatelessWidget {
  const SelectImageBottomSheet({super.key});
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // camera
                  SelectImageButton(
                        onTap: () {},
                        icon: CupertinoIcons.camera,
                        title: "گرفتن عکس",
                      ),
                  // gallery
                  SelectImageButton(
                        onTap: () {},
                        icon: Iconsax.gallery,
                        title: "از گالری",
                      ),
                ],
              )
          );
        }
    );
  }
}

