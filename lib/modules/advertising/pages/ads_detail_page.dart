import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/resources/load_network_image.dart';
import 'package:flutter_divar_clone/helpers/widgets/button_widget.dart';
import 'package:flutter_divar_clone/helpers/widgets/loading_widget.dart';
import 'package:flutter_divar_clone/modules/advertising/controller/ads_detail_controller.dart';
import 'package:flutter_divar_clone/modules/advertising/widgets/connect_info_bottom_sheet.dart';
import 'package:flutter_divar_clone/modules/advertising/widgets/detail_action_button.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AdsDetailPage extends StatelessWidget {
  const AdsDetailPage({Key? key, required this.adsId}) : super(key: key);
  final int adsId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<AdsDetailController>(
          init: AdsDetailController(id: adsId),
          builder: (controller) {
            if (controller.detail == null) {
              return LoadingWidget(
                color: Theme.of(context).colorScheme.primary,
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // image
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                // ads image
                                SizedBox(
                                  width: double.infinity,
                                  height: 350,
                                  child: LoadNetworkImage(
                                    imageUrl: controller.detail!.image!,
                                  ),
                                ),
                                // actions
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            ),
                            const SizedBox(height: 16),
                            // ads title
                            Text(
                              controller.detail!.title ?? "",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            // description
                            const Text(
                              "توضیحات",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadiusDirectional.circular(12)),
                              child: Text(
                                controller.detail!.description ?? "",
                                style:
                                const TextStyle(color: Color(0xFF606060)),
                              ),
                            ),
                            // price
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadiusDirectional.circular(12)),
                              child: Row(
                                children: [
                                  const Text(
                                    "قیمت",
                                    style:
                                    TextStyle(color: Color(0xFF606060)),
                                  ),
                                  const Spacer(),
                                  Text(
                                    controller.detail!.price ?? "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    "تومان",
                                    style: TextStyle(
                                        color: Color(0xFFA7A7A7),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // call info button
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ButtonWidget(
                        width: 160,
                        radius: 60,
                        icon: Iconsax.call,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => ConnectInfoBottomSheet(
                              mobile:
                              controller.detail!.contactInfo!.mobile ?? "",
                              address:
                              controller.detail!.contactInfo!.address ?? "",
                            ),
                          );
                        },
                        text: "اطلاعات تماس",
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
