import 'package:flutter/cupertino.dart';
import 'package:flutter_divar_clone/backend/models/city.dart';
import 'package:flutter_divar_clone/backend/models/province.dart';
import 'package:flutter_divar_clone/backend/repository/auth_repository.dart';
import 'package:flutter_divar_clone/backend/response/auth_response.dart';
import 'package:flutter_divar_clone/backend/response/province_response.dart';
import 'package:get/get.dart';


class RegisterController extends GetxController {
//=========================== variables ========================================
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullNameText = TextEditingController();
  final TextEditingController addressText = TextEditingController();
  final TextEditingController phoneNumberText = TextEditingController();
  final TextEditingController passwordText = TextEditingController();
  final TextEditingController repeatPasswordText = TextEditingController();
  final AuthRepository _repository = AuthRepository();
  bool loading = false;
  ProvinceResponse? provinces;
  AuthResponse? authResponse;
  Province? selectedProvince;
  City? selectedCity;

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

  Future<void> fetchProvinceAndCities() async {
    final response = await _repository.getAllProvinceAndCityApi();
    provinces = response;
    update();
  }

  void onSelectCity(City city){
    selectedCity = city;
    update();
  }

  void onSelectProvince(Province province){
    selectedProvince = province;
    update();
  }

  void register(){
    if(formKey.currentState!.validate()){
      
    }
  }

//=========================== life cycle =======================================
@override
  void onInit() {
    fetchProvinceAndCities();
    super.onInit();
  }
}