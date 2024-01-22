import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar({required String message,required SnackBarType type}){
  Get.snackbar(
      type == SnackBarType.success? "عملیات موفق!" : "خطا!",
      message,
      margin: const EdgeInsets.all(20),
      backgroundColor: type == SnackBarType.success? Colors.green : Colors.redAccent,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM
  );
}

enum SnackBarType {success,error}