import 'package:flutter_divar_clone/backend/repository/base_repository.dart';
import 'package:flutter_divar_clone/backend/response/ads_response.dart';

class AdsRepository extends BaseRepository {
  Future<AdsResponse> getAndFilterAdsApi({int? cityId, int? provinceId, int? categoryId, String? orderBy, String? orderType, String? searchKeyWord}) async {
    final Map<String,dynamic> params = {
      "order_by" : orderBy,
      "order_type" : orderType
    };
    final response = await dio.get("/ad",queryParameters: params);
    validateResponse(response);
    return AdsResponse.fromJson(response.data);
  }
}