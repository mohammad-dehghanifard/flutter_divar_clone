import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/widgets/page_app_bar_widget.dart';
import 'package:flutter_divar_clone/modules/profile/controller/user_boomark_and_ads_controller.dart';
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
          builder: (context) {
            return Column(
              children: [
                PageAppBarWidget(name: state == UserPageState.bookMark? "نشان شده ها" : "آگهی های من"),
              ],
            );
          }
        ),
      ),
    );
  }
}

enum UserPageState {bookMark,userAds}
