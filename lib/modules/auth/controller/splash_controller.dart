import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

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
    final connectionActivityResult = await Connectivity().checkConnectivity();
    if (connectionActivityResult == ConnectivityResult.mobile ||
        connectionActivityResult == ConnectivityResult.wifi) {
      connection = true;
      update();
    } else {
      connection = false;
      update();
    }
    loading = false;
    update();
    // Navigate to start page
    if(connection){

    }
  }

//=========================== LifeCycle ========================================
@override
  void onInit() {
    checkConnection();
    super.onInit();
  }
}