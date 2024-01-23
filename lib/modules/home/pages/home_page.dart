import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/backend/models/advertising.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/resources/load_network_image.dart';
import 'package:flutter_divar_clone/helpers/widgets/loading_widget.dart';
import 'package:flutter_divar_clone/modules/home/controller/home_controller.dart';
import 'package:flutter_divar_clone/modules/home/widgets/home_app_bar_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return   Scaffold(
          body: SafeArea(
              child: controller.adsResponse == null?  LoadingWidget(color: Theme.of(context).colorScheme.primary)
                  :Column(
            children: [
              const HomeAppBarWidget(title: "آگهی های جدید"),
              Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(Distance.bodyMargin),
                    itemCount: controller.adsResponse!.data!.length,
                      itemBuilder: (context, index) {
                        final Advertising ads = controller.adsResponse!.data![index];
                        return Container(
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
                              )
                            ],
                          ),
                        );
                      },)
              )
            ],
          )),
        );
      }
    );
  }
}






