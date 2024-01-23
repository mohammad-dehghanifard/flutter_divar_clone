import 'package:dio/dio.dart';
import 'package:flutter_divar_clone/helpers/resources/user_helper.dart';
import 'package:flutter_divar_clone/helpers/widgets/show_snack_bar.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

class BaseRepository {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://divar.hitaldev.ir/api",
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
       headers: {
         "Accept" : "application/json",
         if(Get.isRegistered<UserHelper>())
         "Authorization" : "Bearer ${Get.find<UserHelper>().token}"
       },
      contentType: "application/json"
    ),
  );

  void validateResponse(Response response){
    if(response.statusCode != 200){
      showSnackBar(message: response.data['message'] ?? "خطای ناشناخته", type: SnackBarType.error);
    }
  }
}