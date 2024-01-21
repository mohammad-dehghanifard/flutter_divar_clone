import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
//=========================== variables ========================================
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullNameText = TextEditingController();
  final TextEditingController addressText = TextEditingController();
  final TextEditingController phoneNumberText = TextEditingController();
  final TextEditingController passwordText = TextEditingController();
  final TextEditingController repeatPasswordText = TextEditingController();
  bool loading = false;

//=========================== Methods ==========================================

  //#region Validate Forms Methods
  String? validateFullNameForm(String? value){
    if(value!.isEmpty){
      return "لطفا یک نام کاربری وارد کنید!";
    } else if(value.length < 3){
      return "نام کابری وارد شده بسیار کوتاه میباشد!";
    }
    return null;
  }

  String? validatePhoneNumberForm(String? value){
    if(value!.isEmpty){
      return "لطفا یک شماره موبایل معتبر وارد کنید!";
    } else if(value.length < 11){
      return "شماره موبایل باید 11 رقم باشد!!";
    }
    return null;
  }

  String? validateAddressForm(String? value){
    if(value!.isEmpty){
      return "لطفا یک آدرس معتبر وارد کنید!";
    }
    return null;
  }

  String? validatePasswordForm(String? value){
    if(value!.isEmpty){
      return "لطفا یک کلمه عبور قوی وارد کنید!";
    } else if(value.length < 8){
      return "رمز عبور باید بیشتر از 8 کاراکتر باشد!";
    }
    return null;
  }

  String? validateRepeatPasswordForm(String? value){
    if(value!.isEmpty){
      return "لطفا کلمه عبور خود را مجدد وارد کنید!";
    } else if(value != passwordText.text){
      return "تکرار رمز عبور با رمز وارد شده یکسان نمیباشد!";
    }
    return null;
  }
  //#endregion

  void register(){
    if(formKey.currentState!.validate()){

    }
  }
//=========================== LifeCycle ========================================

}