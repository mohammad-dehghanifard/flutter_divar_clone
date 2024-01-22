import 'package:flutter_divar_clone/backend/models/province.dart';

class ProvinceResponse {
  List<Province>? provinceList;

  ProvinceResponse({this.provinceList});

  ProvinceResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      provinceList = <Province>[];
      json['data'].forEach((v) {
        provinceList!.add(Province.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (provinceList != null) {
      data['data'] = provinceList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




