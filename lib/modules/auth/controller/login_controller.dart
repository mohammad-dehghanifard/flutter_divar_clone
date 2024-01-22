import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/backend/repository/auth_repository.dart';
import 'package:flutter_divar_clone/helpers/widgets/show_snack_bar.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //=========================== variables ========================================
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberText = TextEditingController();
  final TextEditingController passwordText = TextEditingController();
  final AuthRepository _repository = AuthRepository();
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

  Future<void> login() async {
    if(formKey.currentState!.validate()){
      loading = true;
      update();
      final result = await _repository.loginApi(mobile: phoneNumberText.text, password: passwordText.text);
      if(result.user != null){
        showSnackBar(message: "با موفقیت وارد شدید!", type: SnackBarType.success);
      }
      loading = false;
      update();
    }
  }
}