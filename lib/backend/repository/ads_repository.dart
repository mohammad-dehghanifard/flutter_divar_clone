import 'package:flutter_divar_clone/backend/models/ads_detail.dart';
import 'package:flutter_divar_clone/backend/repository/base_repository.dart';
import 'package:flutter_divar_clone/backend/response/ads_response.dart';
import 'package:flutter_divar_clone/backend/response/category_response.dart';
import 'package:flutter_divar_clone/backend/response/province_response.dart';

class AdsRepository extends BaseRepository {
  // get all ads
  Future<AdsResponse> getAndFilterAdsApi({int? cityId, int? provinceId, int? categoryId, String? orderBy, String? orderType, String? searchKeyWord}) async {
    final Map<String,dynamic> params = {
      "order_by" : orderBy,
      "order_type" : orderType,
      "city_id" : cityId,
      if(categoryId != null)
      "category_id" : categoryId,
      if(searchKeyWord != null)
       "keyword" : searchKeyWord
    };
    final response = await dio.get("/ad",queryParameters: params);
    validateResponse(response);
    return AdsResponse.fromJson(response.data);
  }
  //get province and city
  Future<ProvinceResponse?> getAllProvinceAndCityApi() async {
    final response = await dio.get("/provinces");
    return ProvinceResponse.fromJson(response.data);
  }
  // get all category
  Future<CategoryResponse> getAllCategoryApi() async {
    final response = await dio.get("/categories");
    validateResponse(response);
    return CategoryResponse.fromJson(response.data);
  }
  // get ads detail
  Future<AdsDetail> getAdsDetailApi({required int id}) async {
    final response  = await dio.get("/ad/$id");
    validateResponse(response);
    return AdsDetail.fromJson(response.data['data']);
  }

}