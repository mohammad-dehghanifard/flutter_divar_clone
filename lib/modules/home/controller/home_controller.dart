import 'package:flutter_divar_clone/backend/models/city.dart';
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
  City? selectedCity;

//=========================== Methods ==========================================
  Future<void> fetchHomeAds() async {
    final result = await _adsRepository.getAndFilterAdsApi(orderBy: sort?.orderBy,orderType: sort?.orderType,cityId: selectedCity?.id);
    adsResponse = result;
    update();
  }

  Future<void> getAllProvince() async {
    final result = await _adsRepository.getAllProvinceAndCityApi();
    provinces = result;
    update();
  }

  void sortAds(Sort newSort){
    sort = newSort;
    fetchHomeAds();
    update();
  }

  void onSelectCity(City city){
    selectedCity = city;
    update();
  }

  void filterAdsByCityId() {
    if(selectedCity != null){
      fetchHomeAds();
      Get.back();
      update();
    }
  }



//=========================== life cycle =======================================
@override
  void onInit() {
    fetchHomeAds();
    getAllProvince();
    super.onInit();
  }
}


class Sort {
  Sort({ this.orderBy, this.orderType});
  final String? orderBy;
  final String? orderType;
}