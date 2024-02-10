import 'package:flutter_divar_clone/backend/repository/profile_repository.dart';
import 'package:flutter_divar_clone/backend/response/ads_response.dart';
import 'package:flutter_divar_clone/modules/profile/pages/bookmark_and_user_ads_page.dart';
import 'package:get/get.dart';

class UserBookMarkAndAdsController extends GetxController {
  UserBookMarkAndAdsController(this.state);
  final UserPageState state;
//=========================== variables ========================================
  final ProfileRepository _repository = ProfileRepository();
  AdsResponse? adsResponse;
//=========================== Methods ==========================================


//=========================== life cycle =======================================
  @override
  void onInit() {
    super.onInit();
  }

}