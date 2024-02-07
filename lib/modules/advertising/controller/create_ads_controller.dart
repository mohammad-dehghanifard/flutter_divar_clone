import 'package:flutter/cupertino.dart';
import 'package:flutter_divar_clone/backend/models/category.dart';
import 'package:flutter_divar_clone/backend/models/city.dart';
import 'package:flutter_divar_clone/backend/models/province.dart';
import 'package:flutter_divar_clone/backend/repository/ads_repository.dart';
import 'package:flutter_divar_clone/backend/response/category_response.dart';
import 'package:flutter_divar_clone/backend/response/province_response.dart';
import 'package:flutter_divar_clone/helpers/widgets/show_snack_bar.dart';
import 'package:flutter_divar_clone/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateAdsController extends GetxController {
//=========================== variables ========================================
  final AdsRepository _repository = AdsRepository();
  final ImagePicker picker = ImagePicker();
  final TextEditingController adsTitleTxt = TextEditingController();
  final TextEditingController descriptionTxt = TextEditingController();
  final TextEditingController priceTxt = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CategoryResponse? categoryResponse;
  ProvinceResponse? provinceResponse;
  Category? selectedCategory;
  Province? selectedProvince;
  City? selectCity;
  XFile? image;

//=========================== Methods ==========================================

  Future<void> fetchAllCategory() async {
    final result = await _repository.getAllCategoryApi();
    categoryResponse = result;
    update();
  }

  Future<void> fetchProvinceAndCity() async {
    final result = await _repository.getAllProvinceAndCityApi();
    provinceResponse = result;
    update();
  }

  void changeCategory(Category newCategory){
    selectedCategory = newCategory;
    update();
  }

  void changeProvince(Province newProvince){
    selectedProvince = newProvince;
    update();
  }

  void changeCity(City newCity){
    selectCity = newCity;
    update();
  }

  Future<void> setImageForAds(ImageSource source) async {
    final XFile? result = await picker.pickImage(source: source);
    if(result != null){
      image = result;
      showSnackBar(message: "عکس با موفقیت انتخاب شد", type: SnackBarType.success);
      update();
    } else {
      showSnackBar(message: "هیچ عکسی انتخاب نکردید!", type: SnackBarType.error);
    }
  }

  String? validateAdsTitleForm(String? value){
    if(value!.isEmpty){
      return "لطفا یک عنوان برای آگهی وارد کنید";
    } else if(value.length < 8){
      return "عنوان وارد شده بسیار کوتاه میباشد";
    }
    return null;
  }

  String? validateAdsDescriptionForm(String? value){
    if(value!.isEmpty){
      return "لطفا توضیحات آگهی خود را وارد کنید";
    } else if(value.length < 8){
      return "توضیحات وارد شده بسیار کوتاه میباشد";
    }
    return null;
  }

  String? validateAdsPriceForm(String? value){
    if(value!.isEmpty){
      return "وارد کردن مبلغ آگهی الزامی میباشد!";
    }
    return null;
  }

  Future<void> saveAds() async {
    if(formKey.currentState!.validate()){
      if(image == null){
        showSnackBar(message: "لطفا یک عکس برای آگهی خود انتخاب کنید", type: SnackBarType.error);
      }else if(selectedCategory == null){
        showSnackBar(message: "لطفا یک دسته بندی برای آگهی خود انتخاب کنید", type: SnackBarType.error);
      } else if (selectedProvince == null || selectCity == null){
        showSnackBar(message: "لطفا استان و شهر آگهی خود انتخاب کنید", type: SnackBarType.error);
      } else {
        final result = await _repository.createNewAdsApi(
            title: adsTitleTxt.text,
            description: descriptionTxt.text,
            price: priceTxt.text,
            categoryId: selectedCategory!.id!,
            cityId: selectCity!.id!,
            image: image!);
        if(result){
          Get.back();
          showSnackBar(message: "آگهی مورد نظر با موفقیت ایجاد شد!", type: SnackBarType.success);
          Get.find<HomeController>().fetchHomeAds();
        }else {
          showSnackBar(message: "خطایی رخ داده مجددا تلاش کنید", type: SnackBarType.error);

        }
      }
    }
  }

//=========================== LifeCycle ========================================
  @override
  void onInit() {
    fetchAllCategory();
    fetchProvinceAndCity();
    super.onInit();
  }
}