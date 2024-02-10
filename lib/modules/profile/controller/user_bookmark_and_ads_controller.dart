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
  Future<void> fetchData() async {
    final bool bookMark = state == UserPageState.bookMark? true : false;
    final result = await _repository.getAllBookMarkAndAdsApi(bookMark: bookMark);
    adsResponse = result;
    update();
  }

//=========================== life cycle =======================================
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

}