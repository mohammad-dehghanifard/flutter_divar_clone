import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/modules/home/controller/dashboard_controller.dart';
import 'package:flutter_divar_clone/modules/home/pages/home_page.dart';
import 'package:flutter_divar_clone/modules/home/widgets/button_navigation_widget.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<DashboardController>(
          init: DashboardController(),
          builder: (controller) {
            return Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    children: [
                      HomePage(),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.orange,
                      ),
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


