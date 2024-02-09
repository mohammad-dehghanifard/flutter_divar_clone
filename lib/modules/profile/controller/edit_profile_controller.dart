import 'package:flutter/cupertino.dart';
import 'package:flutter_divar_clone/backend/models/city.dart';
import 'package:flutter_divar_clone/backend/models/province.dart';
import 'package:flutter_divar_clone/backend/repository/profile_repository.dart';
import 'package:flutter_divar_clone/backend/response/province_response.dart';
import 'package:flutter_divar_clone/helpers/widgets/show_snack_bar.dart';
import 'package:flutter_divar_clone/modules/profile/controller/profile_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
//=========================== variables ========================================
  final ProfileRepository _repository = ProfileRepository();
  final TextEditingController userFullName = TextEditingController();
  final TextEditingController userAddress = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  bool loading = false;
  ProvinceResponse? provinceResponse;
  XFile? avatar;
  Province? selectedProvince;
  City? selectedCity;


//=========================== Methods ==========================================
  String? validateUserFullNameForm(String? value){
    if(value!.isEmpty){
      return "لطفا یک نام معتبر وارد کنید";
    } else if(value.length < 3){
      return "نام وارد شده بسیار کوتاه میباشد!";
    }
    return null;
  }

  String? validateUserAddressForm(String? value){
    if(value!.isEmpty){
      return "لطفا یک آدرس معتبر وارد کنید";
    } else if(value.length < 3){
      return "آدرس وارد شده بسیار کوتاه میباشد!";
    }
    return null;
  }

  Future<void> setAvatarImage() async {
    final XFile? result = await picker.pickImage(source: ImageSource.gallery);
    if(result != null){
      avatar = result;
      showSnackBar(message: "عکس با موفقیت انتخاب شد", type: SnackBarType.success);
      update();
    } else {
      showSnackBar(message: "هیچ عکسی انتخاب نکردید!", type: SnackBarType.error);
    }
  }

  Future<void> editUser() async {
    if(formKey.currentState!.validate()){
      if(selectedCity == null){
        showSnackBar(message: "لطفا شهر خود را انتخاب کنید!", type: SnackBarType.error);
      } else {
        loading = true;
        update();
        final result = await _repository.editProfileApi(
            avatar: avatar,
            name: userFullName.text,
            address: userAddress.text,
            cityId: selectedCity!.id!);
        loading = false;
        update();
        if(result){
          Get.back();
          showSnackBar(message: "اطلاعات با موفقیت ویرایش شد", type: SnackBarType.success);
          Get.find<ProfileController>().fetchUserInfo();
        }
      }
    }
  }

  Future<void> getAllProvinceAndResponse() async {
    final result = await _repository.getAllProvinceAndCityApi();
    provinceResponse = result;
    update();
  }

  void changeProvince(Province value) {
    selectedProvince = value;
    update();
  }

  void changeCity(City value) {
    selectedCity = value;
    update();
  }

//=========================== life cycle =======================================
  @override
  void onInit() {
    getAllProvinceAndResponse();
    super.onInit();
  }


}