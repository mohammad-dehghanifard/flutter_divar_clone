import 'package:flutter_divar_clone/backend/repository/ads_respository.dart';
import 'package:flutter_divar_clone/backend/response/ads_response.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
//=========================== variables ========================================
  final AdsRepository _adsRepository = AdsRepository();
  AdsResponse? adsResponse;

//=========================== Methods ==========================================
  Future<void> fetchHomeAds() async {
    final result = await _adsRepository.getAndFilterAdsApi();
    adsResponse = result;
  }
//=========================== life cycle =======================================
@override
  void onInit() {
    fetchHomeAds();
    super.onInit();
  }
}