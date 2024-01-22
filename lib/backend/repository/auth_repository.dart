import 'package:flutter_divar_clone/backend/repository/base_repository.dart';
import 'package:flutter_divar_clone/backend/response/province_response.dart';

class AuthRepository extends BaseRepository {
  Future<ProvinceResponse?> getAllProvinceAndCityApi() async {
    try{
      final response = await dio.get("/provinces");
      return ProvinceResponse.fromJson(response.data);
    }catch(e){
      print(e);
    }

  }
}