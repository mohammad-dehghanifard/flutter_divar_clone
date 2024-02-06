import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/resources/load_network_image.dart';
import 'package:flutter_divar_clone/helpers/widgets/loading_widget.dart';
import 'package:flutter_divar_clone/modules/profile/controller/profile_controller.dart';
import 'package:flutter_divar_clone/modules/profile/widgets/profile_button.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              // buttons
              ProfileButton(
                onTap: () {},
                text: "ویرایش پروفایل",
                icon: Iconsax.user_edit,
              )
            ],
          ),
        );
      }
    );
  }
}
