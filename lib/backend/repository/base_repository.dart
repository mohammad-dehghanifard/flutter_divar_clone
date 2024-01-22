import 'package:dio/dio.dart';
import 'package:flutter_divar_clone/helpers/widgets/show_snack_bar.dart';

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
       },
      contentType: "application/json"
    ),
  );

  void validateResponse(Response response){
    showSnackBar(message: response.data['message'], type: SnackBarType.error);
  }
}