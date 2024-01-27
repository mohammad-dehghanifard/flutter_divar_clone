import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
//=========================== variables ========================================
  final PageController pageController = PageController();
  int currentPage = 0;

//=========================== Methods ==========================================
  void onChangePage(int newPage) {
    currentPage = newPage;
    pageController.animateToPage(newPage, duration: const Duration(milliseconds: 700), curve: Curves.linear);
    update();
  }
}