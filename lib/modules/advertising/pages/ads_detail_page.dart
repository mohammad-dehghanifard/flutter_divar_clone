import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/resources/load_network_image.dart';
import 'package:flutter_divar_clone/helpers/widgets/loading_widget.dart';
import 'package:flutter_divar_clone/modules/advertising/controller/ads_detail_controller.dart';
import 'package:flutter_divar_clone/modules/advertising/widgets/detail_action_button.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AdsDetailPage extends StatelessWidget {
  const AdsDetailPage({super.key, required this.adsId});
  final int adsId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<AdsDetailController>(
          init: AdsDetailController(id: adsId),
          builder: (controller) {
            return controller.detail == null?
              LoadingWidget(color: Theme.of(context).colorScheme.primary)
                : Padding(
                  padding: const EdgeInsets.all(Distance.bodyMargin),
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                        child: Column(
                          children: [
                            // image
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                // ads image
                                SizedBox(
                                  width: 350,
                                  height: 350,
                                  child: LoadNetworkImage(
                                      imageUrl: controller.detail!.image!),
                                ),
                                // actions
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // book mark
                                      DetailActionButton(
                                        onTap: () {},
                                        icon: Iconsax.archive_add,
                                      ),
                                      //back
                                      DetailActionButton(
                                        onTap: () => Get.back(),
                                        icon: Iconsax.arrow_left,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                );
          }
        ),
      ),
    );
  }
}

