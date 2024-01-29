import 'package:flutter_divar_clone/backend/repository/ads_repository.dart';
import 'package:flutter_divar_clone/backend/response/ads_response.dart';
import 'package:flutter_divar_clone/backend/response/province_response.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
//=========================== variables ========================================
  final AdsRepository _adsRepository = AdsRepository();
  AdsResponse? adsResponse;
  Sort? sort;
  ProvinceResponse? provinces;
  int? cityID;

//=========================== Methods ==========================================
  Future<void> fetchHomeAds() async {
    final result = await _adsRepository.getAndFilterAdsApi(orderBy: sort?.orderBy,orderType: sort?.orderType,cityId: cityID);
    adsResponse = result;
    update();
  }

  void sortAds(Sort newSort){
    sort = newSort;
    fetchHomeAds();
    update();
  }

//=========================== life cycle =======================================
@override
  void onInit() {
    fetchHomeAds();
    super.onInit();
  }
}


class Sort {
  Sort({ this.orderBy, this.orderType});
  final String? orderBy;
  final String? orderType;
}