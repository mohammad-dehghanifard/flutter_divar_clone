import 'package:flutter_divar_clone/backend/models/category.dart';
import 'package:flutter_divar_clone/backend/models/province.dart';
import 'package:flutter_divar_clone/backend/repository/ads_repository.dart';
import 'package:flutter_divar_clone/backend/response/category_response.dart';
import 'package:flutter_divar_clone/backend/response/province_response.dart';
import 'package:get/get.dart';

class CreateAdsController extends GetxController {
//=========================== variables ========================================
  final AdsRepository _repository = AdsRepository();
  CategoryResponse? categoryResponse;
  ProvinceResponse? provinceResponse;
  Category? selectedCategory;
  Province? selectedProvince;

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

//=========================== LifeCycle ========================================
  @override
  void onInit() {
    fetchAllCategory();
    fetchProvinceAndCity();
    super.onInit();
  }
}