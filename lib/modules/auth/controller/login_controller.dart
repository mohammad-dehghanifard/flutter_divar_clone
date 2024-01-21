import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //=========================== variables ========================================
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberText = TextEditingController();
  final TextEditingController passwordText = TextEditingController();
  bool loading = false;

//=========================== Methods ==========================================

  //#region Validate Forms Methods
  String? validatePhoneNumberForm(String? value){
    if(value!.isEmpty){
      return "لطفا یک شماره موبایل معتبر وارد کنید!";
    } else if(value.length < 11){
      return "شماره موبایل باید 11 رقم باشد!!";
    }
    return null;
  }

  String? validatePasswordForm(String? value){
    if(value!.isEmpty){
      return "لطفا کلمه عبور خود را وارد کنید!";
    } else if(value.length < 8){
      return "رمز عبور باید بیشتر از 8 کاراکتر باشد!";
    }
    return null;
  }
  //#endregion

  void login(){
    if(formKey.currentState!.validate()){

    }
  }
}