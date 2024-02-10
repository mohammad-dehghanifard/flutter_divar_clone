import 'package:dio/dio.dart';
import 'package:flutter_divar_clone/backend/models/user.dart';
import 'package:flutter_divar_clone/backend/repository/base_repository.dart';
import 'package:flutter_divar_clone/backend/response/ads_response.dart';
import 'package:flutter_divar_clone/backend/response/result_response.dart';
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
  // get all book mark and user ads
  Future<AdsResponse> getAllBookMarkAndAdsApi({bool bookMark = true}) async {
    if(bookMark){
      final response = await dio.get('/bookmarks');
      validateResponse(response);
      return AdsResponse.fromJson(response.data);
    } else {
      final response = await dio.get('/user/ads');
      validateResponse(response);
      return AdsResponse.fromJson(response.data);
    }
  }
  // add or remove bookmark
  Future<ResultResponse> addOrRemoveBookMarkApi({required int id}) async {
    final response = await dio.post("/ad/$id/bookmark");
    validateResponse(response);
    return ResultResponse.fromJson(response.data);
  }
  // remove ads
  Future<ResultResponse> removeAdsApi({required int id}) async {
    final response = await dio.delete("/ad/$id");
    validateResponse(response);
    return ResultResponse.fromJson(response.data);
  }
}