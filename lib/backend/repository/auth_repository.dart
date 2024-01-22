import 'package:flutter_divar_clone/backend/repository/base_repository.dart';
import 'package:flutter_divar_clone/backend/response/auth_response.dart';
import 'package:flutter_divar_clone/backend/response/province_response.dart';

class AuthRepository extends BaseRepository {
  //get province and city
  Future<ProvinceResponse?> getAllProvinceAndCityApi() async {
      final response = await dio.get("/provinces");
      return ProvinceResponse.fromJson(response.data);
  }
  // register
  Future<AuthResponse> registerApi({required String name,required String mobile,required int cityId,required String address,required String password,required String confirmPass}) async {
    final Map<String,dynamic> data = {
      "name": name,
      "mobile": mobile,
      "address": address,
      "city_id": cityId.toString(),
      "password": password,
      "password_confirmation": confirmPass
    };
    final response = await dio.post("/register",data: data);
    return AuthResponse.fromJson(response.data);
  }
}