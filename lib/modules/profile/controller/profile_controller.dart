import 'package:flutter_divar_clone/backend/models/user.dart';
import 'package:flutter_divar_clone/backend/repository/profile_repository.dart';
import 'package:flutter_divar_clone/modules/auth/pages/start_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
//=========================== variables ========================================
  final ProfileRepository _repository = ProfileRepository();
  User? userInfo;

//=========================== Methods ==========================================
  Future<void> fetchUserInfo() async {
    final result = await _repository.getUserInfo();
    userInfo = result;
    update();
  }

  Future<void> logOut() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Get.offAll(const StartPage());
  }

//=========================== life cycle =======================================
  @override
  void onInit() {
    fetchUserInfo();
    super.onInit();
  }

}