import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/modules/advertising/pages/category_page.dart';
import 'package:flutter_divar_clone/modules/home/controller/dashboard_controller.dart';
import 'package:flutter_divar_clone/modules/home/controller/home_controller.dart';
import 'package:flutter_divar_clone/modules/home/pages/home_page.dart';
import 'package:flutter_divar_clone/modules/home/widgets/button_navigation_widget.dart';
import 'package:flutter_divar_clone/modules/home/widgets/home_app_bar_widget.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // بعدا به بخش دیگه منتقل بشه
    Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<DashboardController>(
          init: DashboardController(),
          builder: (controller) {
            return Column(
              children: [
                HomeAppBarWidget(
                  title: controller.appBarText,
                  cityName: Get.find<HomeController>().selectedCity != null?Get.find<HomeController>().selectedCity!.name! : "انتخاب شهر",
                ),

                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    children: [
                      const HomePage(),
                      const CategoryPage(),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.redAccent,
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ),
                // button navigation
                ButtonNavigationWidget(controller: controller)
              ],
            );
          }
        ),
      ),
    );
  }
}


