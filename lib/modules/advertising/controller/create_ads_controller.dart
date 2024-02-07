import 'package:flutter_divar_clone/backend/models/category.dart';
import 'package:flutter_divar_clone/backend/models/city.dart';
import 'package:flutter_divar_clone/backend/models/province.dart';
import 'package:flutter_divar_clone/backend/repository/ads_repository.dart';
import 'package:flutter_divar_clone/backend/response/category_response.dart';
import 'package:flutter_divar_clone/backend/response/province_response.dart';
import 'package:flutter_divar_clone/helpers/widgets/show_snack_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateAdsController extends GetxController {
//=========================== variables ========================================
  final AdsRepository _repository = AdsRepository();
  final ImagePicker picker = ImagePicker();
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

//=========================== LifeCycle ========================================
  @override
  void onInit() {
    fetchAllCategory();
    fetchProvinceAndCity();
    super.onInit();
  }
}