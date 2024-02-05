import 'package:flutter/cupertino.dart';
import 'package:flutter_divar_clone/backend/models/advertising.dart';
import 'package:flutter_divar_clone/backend/repository/ads_repository.dart';
import 'package:get/get.dart';

class AdsSearchController extends GetxController {
//=========================== variables ========================================
  final AdsRepository _repository = AdsRepository();
  final TextEditingController searchText = TextEditingController();
  List<Advertising>? adsList;

//=========================== Methods ==========================================
  Future<void> searchAdsResult() async {
    adsList = null;
    update();
    final result = await _repository.getAndFilterAdsApi(searchKeyWord: searchText.text);
    adsList = result.data!;
    update();
  }
}