import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
//=========================== variables ========================================
  bool connection = true;

//=========================== Methods ==========================================
  Future<void> checkConnection() async {
    final connectionActivityResult = await Connectivity().checkConnectivity();

    if (connectionActivityResult == ConnectivityResult.mobile ||
        connectionActivityResult == ConnectivityResult.wifi) {
      connection = true;
      update();
    } else {
      connection = false;
      update();
    }
  }

//=========================== LifeCycle ========================================
@override
  void onInit() {
    checkConnection();
    super.onInit();
  }
}