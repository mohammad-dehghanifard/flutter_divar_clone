import 'package:flutter_divar_clone/backend/models/category.dart';

class CategoryResponse {
  List<Category>? data;

  CategoryResponse({this.data});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Category>[];
      json['data'].forEach((v) {
        data!.add(Category.fromJson(v));
      });
    }
  }

}

