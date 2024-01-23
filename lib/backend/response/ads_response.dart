import 'package:flutter_divar_clone/backend/models/advertising.dart';

class AdsResponse {
  List<Advertising>? data;

  AdsResponse({this.data});

  AdsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Advertising>[];
      json['data'].forEach((v) {
        data!.add(Advertising.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


