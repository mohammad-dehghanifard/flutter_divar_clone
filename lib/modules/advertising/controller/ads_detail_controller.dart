import 'package:flutter_divar_clone/backend/models/ads_detail.dart';
import 'package:flutter_divar_clone/backend/repository/ads_repository.dart';
import 'package:flutter_divar_clone/backend/response/result_response.dart';
import 'package:flutter_divar_clone/helpers/widgets/show_snack_bar.dart';
import 'package:get/get.dart';

class AdsDetailController extends GetxController {
  AdsDetailController({required this.id});
  final int id;
//=========================== variables ========================================
  final AdsRepository _repository = AdsRepository();
  AdsDetail? detail;
  bool loading = false;

//=========================== Methods ==========================================
  Future<void> fetchAdsDetail() async {
    final result = await _repository.getAdsDetailApi(id: id);
    detail = result;
    update();
  }

  Future<void> bookMarkAds() async {
    loading = true;
    update();
    final ResultResponse result = await _repository.addOrRemoveBookMarkApi(id: id);
    loading = false;
    update();
    showSnackBar(message: result.message!,type: SnackBarType.success);
  }

//=========================== LifeCycle ========================================
  @override
    void onInit() {
      fetchAdsDetail();
      super.onInit();
    }
}