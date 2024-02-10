import 'package:flutter_divar_clone/backend/repository/profile_repository.dart';
import 'package:flutter_divar_clone/backend/response/ads_response.dart';
import 'package:flutter_divar_clone/backend/response/book_mark_response.dart';
import 'package:flutter_divar_clone/backend/response/result_response.dart';
import 'package:flutter_divar_clone/helpers/widgets/show_snack_bar.dart';
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

  Future<void> bookMarkAds(int id) async {
    final BookMarkResponse result = await _repository.addOrRemoveBookMarkApi(id: id);
    fetchData();
    showSnackBar(message: result.message!,type: SnackBarType.success);
  }

  Future<void> deleteAds(int id) async {
    final ResultResponse result = await _repository.removeAdsApi(id: id);
    if(result.success!) {
      showSnackBar(message: result.message!,type: SnackBarType.success);
      adsResponse!.data!.removeWhere((adsItem) => adsItem.id! == id);
      update();
    } else {
      showSnackBar(message: result.message!,type: SnackBarType.error);
    }
  }

//=========================== life cycle =======================================
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

}