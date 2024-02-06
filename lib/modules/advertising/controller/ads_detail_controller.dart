import 'package:flutter_divar_clone/backend/models/ads_detail.dart';
import 'package:flutter_divar_clone/backend/repository/ads_repository.dart';
import 'package:get/get.dart';

class AdsDetailController extends GetxController {
  AdsDetailController({required this.id});
  final int id;
//=========================== variables ========================================
  final AdsRepository _repository = AdsRepository();
  AdsDetail? detail;

//=========================== Methods ==========================================
  Future<void> fetchAdsDetail() async {
    final result = await _repository.getAdsDetailApi(id: id);
    detail = result;
    update();
  }

//=========================== LifeCycle ========================================
  @override
    void onInit() {
      fetchAdsDetail();
      super.onInit();
    }
}