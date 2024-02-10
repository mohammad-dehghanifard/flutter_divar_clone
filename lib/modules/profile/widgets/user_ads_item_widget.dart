import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/backend/models/advertising.dart';
import 'package:flutter_divar_clone/helpers/resources/load_network_image.dart';
import 'package:flutter_divar_clone/modules/advertising/pages/ads_detail_page.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAdsItemWidget extends StatelessWidget {
  const UserAdsItemWidget({
    super.key,
    required this.ads,
  });

  final Advertising ads;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(AdsDetailPage(adsId: ads.id!)),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 10,offset: const Offset(0,3)
              )
            ]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ads image
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LoadNetworkImage(imageUrl: ads.image ?? ""),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title
                  Row(
                    children: [
                      // title
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        child: Text(ads.title ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Spacer(),
                      // remove button
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Iconsax.trash,size: 18))
                    ],
                  ),
                  const SizedBox(height: 20),
                  // price
                  Row(
                    children: [
                      Text(ads.price ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                      const SizedBox(width: 4),
                      const Text("تومان",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF959595),
                              fontSize: 12)),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(ads.createdAt ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF959595),
                            fontSize: 12)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}