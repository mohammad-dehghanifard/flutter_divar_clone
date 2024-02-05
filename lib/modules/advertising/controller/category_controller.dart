import 'package:flutter_divar_clone/backend/repository/ads_repository.dart';
import 'package:flutter_divar_clone/backend/response/category_response.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
//=========================== variables ========================================
  final AdsRepository _repository = AdsRepository();
  CategoryResponse? categoryResponse;

//=========================== Methods ==========================================
  Future<void> fetchAllCategory() async {
    final result = await _repository.getAllCategoryApi();
    categoryResponse = result;
    update();
  }


//=========================== LifeCycle ========================================

@override
  void onInit() {
    fetchAllCategory();
    super.onInit();
  }

}