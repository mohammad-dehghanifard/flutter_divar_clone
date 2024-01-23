import 'package:flutter/material.dart';
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
        return  const Scaffold(
          body: SafeArea(child: Column(
            children: [
              HomeAppBarWidget(title: "آگهی های جدید")
            ],
          )),
        );
      }
    );
  }
}




