import 'package:dio/dio.dart';
import 'package:flutter_divar_clone/backend/models/user.dart';
import 'package:flutter_divar_clone/backend/repository/base_repository.dart';
import 'package:flutter_divar_clone/backend/response/province_response.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepository extends BaseRepository {
  // get user info
  Future<User> getUserInfo() async {
    final response = await dio.get("/profile");
    validateResponse(response);
    return User.fromJson(response.data['data']);
  }
  //get province and city
  Future<ProvinceResponse?> getAllProvinceAndCityApi() async {
    final response = await dio.get("/provinces");
    return ProvinceResponse.fromJson(response.data);
  }
  // edit profile
  Future<bool> editProfileApi({required XFile? avatar,required String name,required String address,required int cityId}) async {
    final FormData data = FormData.fromMap({
      "name" : name,
      "city_id" : cityId.toString(),
      if(avatar != null)
        "avatar" : MultipartFile.fromFileSync(avatar.path),
      "address" : address

    });
    final response = await dio.post('/profile',data: data);
    validateResponse(response);
    return response.statusCode == 200;
  }
}