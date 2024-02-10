import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/backend/models/advertising.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/loading_widget.dart';
import 'package:flutter_divar_clone/modules/advertising/widgets/ads_list_item_widget.dart';
import 'package:flutter_divar_clone/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return controller.adsResponse == null
              ? LoadingWidget(color: Theme.of(context).colorScheme.primary)
              : Column(
                      children: [

                        Expanded(
                            child: ListView.builder(
                          padding: const EdgeInsets.all(Distance.bodyMargin),
                          itemCount: controller.adsResponse!.data!.length,
                          itemBuilder: (context, index) {
                            final Advertising ads =
                                controller.adsResponse!.data![index];
                            return AdsListItemWidget(ads: ads);
                          },
                        ))
                      ],
                    );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
