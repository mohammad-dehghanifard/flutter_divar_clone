import 'package:flutter/cupertino.dart';
import 'package:flutter_divar_clone/modules/home/widgets/button_navigation_widget.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DashboardController extends GetxController {
//=========================== variables ========================================
  final PageController pageController = PageController();
  String appBarText = "آگهی های جدید";
  int currentPage = 0;
  List<NavItem> navList = [
    const NavItem(icon: Iconsax.home, label: "خانه"),
    const NavItem(icon: Iconsax.category, label: "دسته بندی"),
    const NavItem(icon: Iconsax.search_normal, label: "جست و جو"),
    const NavItem(icon: Iconsax.user, label: "پروفایل"),

  ];

//=========================== Methods ==========================================
  void onChangePage(int newPage) {
    currentPage = newPage;
    if(newPage == 0){
      appBarText = "آگهی های جدید";
    }else {
      appBarText = navList[newPage].label;
    }
    pageController.animateToPage(newPage, duration: const Duration(milliseconds: 700), curve: Curves.linear);
    update();
  }
}