import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/resources/load_network_image.dart';
import 'package:flutter_divar_clone/helpers/widgets/loading_widget.dart';
import 'package:flutter_divar_clone/modules/profile/controller/profile_controller.dart';
import 'package:flutter_divar_clone/modules/profile/pages/bookmark_and_user_ads_page.dart';
import 'package:flutter_divar_clone/modules/profile/pages/edit_profile_page.dart';
import 'package:flutter_divar_clone/modules/profile/widgets/log_out_dialog_body.dart';
import 'package:flutter_divar_clone/modules/profile/widgets/profile_button.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return controller.userInfo == null?  LoadingWidget(color: Theme.of(context).colorScheme.primary) :Padding(
          padding: const EdgeInsets.all(Distance.bodyMargin),
          child: Column(
            children: [
              // user avatar
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,offset: const Offset(0,3)
                    )
                  ]
                ),
                child: LoadNetworkImage(imageUrl: controller.userInfo!.avatar!),
              ),
              const SizedBox(height: 12),
              // user name
              Text(controller.userInfo!.name ?? "",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
              const SizedBox(height: 32),
              // edit user button
              ProfileButton(
                onTap: () => Get.to(const EditProfilePage()),
                text: "ویرایش پروفایل",
                icon: Iconsax.user_edit,
              ),
              const SizedBox(height: 16),
              // my ads button
              ProfileButton(
                onTap: () => Get.to(const BookMarkAndUserAdsPage(state: UserPageState.userAds)),
                text: "آگهی های من",
                icon: Iconsax.task_square,
              ),
              const SizedBox(height: 16),
              // book mark button
              ProfileButton(
                onTap: () => Get.to(const BookMarkAndUserAdsPage(state: UserPageState.bookMark)),
                text: "نشان ها",
                icon: Iconsax.save_2,
              ),
              const SizedBox(height: 16),
              // log out button
              ProfileButton(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => const LogOutDialog());
                },
                text: "خروج از حساب",
                icon: Iconsax.logout,
              ),
            ],
          ),
        );
      }
    );
  }

  @override
  bool get wantKeepAlive => true;
}
