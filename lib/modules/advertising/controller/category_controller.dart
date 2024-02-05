import 'package:flutter_divar_clone/backend/models/advertising.dart';
import 'package:flutter_divar_clone/backend/repository/ads_repository.dart';
import 'package:flutter_divar_clone/backend/response/category_response.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
//=========================== variables ========================================
  final AdsRepository _repository = AdsRepository();
  CategoryResponse? categoryResponse;
  List<Advertising>? adsList;

//=========================== Methods ==========================================
  Future<void> fetchAllCategory() async {
    adsList = null;
    update();
    final result = await _repository.getAllCategoryApi();
    categoryResponse = result;
    update();
  }

  Future<void> fetchAdsByCategoryId(catId) async {
    final result = await _repository.getAndFilterAdsApi(categoryId: catId);
    adsList = result.data!;
    update();
  }


//=========================== LifeCycle ========================================

@override
  void onInit() {
    fetchAllCategory();
    super.onInit();
  }

}