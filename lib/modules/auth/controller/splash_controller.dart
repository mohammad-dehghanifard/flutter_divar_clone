import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_divar_clone/helpers/resources/user_helper.dart';
import 'package:flutter_divar_clone/modules/auth/pages/start_page.dart';
import 'package:flutter_divar_clone/modules/home/pages/dashboard_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
//=========================== variables ========================================
  bool connection = true;
  bool loading = false;

//=========================== Methods ==========================================
  Future<void> checkConnection() async {
    loading = true;
    update();
    await Future.delayed(const Duration(seconds: 3));
    // check client connection
    connection = await _connectionResult();
    loading = false;
    update();
    // Navigate to start page
    if(connection){
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.getString("token")!= null){
        Get.put(UserHelper(prefs.getString("token")));
        Get.off(const DashboardPage());
      }else {
        Get.off(const StartPage());
      }
    }
  }

  Future<bool> _connectionResult() async {
    final connectionActivityResult = await Connectivity().checkConnectivity();
    if (connectionActivityResult == ConnectivityResult.mobile ||
        connectionActivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

//=========================== LifeCycle ========================================
@override
  void onInit() {
    checkConnection();
    super.onInit();
  }
}