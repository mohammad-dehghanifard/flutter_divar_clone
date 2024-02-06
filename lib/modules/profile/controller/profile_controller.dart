import 'package:flutter_divar_clone/backend/models/user.dart';
import 'package:flutter_divar_clone/backend/repository/profile_repository.dart';
import 'package:get/get.dart';

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

//=========================== life cycle =======================================
  @override
  void onInit() {
    fetchUserInfo();
    super.onInit();
  }

}