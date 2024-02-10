import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/constant/distance.dart';
import 'package:flutter_divar_clone/helpers/widgets/loading_widget.dart';
import 'package:flutter_divar_clone/helpers/widgets/page_app_bar_widget.dart';
import 'package:flutter_divar_clone/modules/profile/controller/user_bookmark_and_ads_controller.dart';
import 'package:flutter_divar_clone/modules/profile/widgets/user_ads_item_widget.dart';
import 'package:get/get.dart';

class BookMarkAndUserAdsPage extends StatelessWidget {
  const BookMarkAndUserAdsPage({super.key, required this.state});
  final UserPageState state;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: GetBuilder<UserBookMarkAndAdsController>(
          init: UserBookMarkAndAdsController(state),
          builder: (controller) {
            return Column(
              children: [
                PageAppBarWidget(name: state == UserPageState.bookMark? "نشان شده ها" : "آگهی های من"),
               controller.adsResponse == null?
                Center(child: LoadingWidget(color: Theme.of(context).colorScheme.primary))
                   :Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(Distance.bodyMargin),
                        itemCount: controller.adsResponse!.data!.length,
                        itemBuilder: (context, index) {
                          final ads = controller.adsResponse!.data![index];
                          return UserAdsItemWidget(ads: ads);
                        },
                    ))
              ],
            );
          }
        ),
      ),
    );
  }
}

enum UserPageState {bookMark,userAds}
