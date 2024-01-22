import 'city.dart';

class Province {
  int? id;
  String? name;
  List<City>? cities;

  Province({this.id, this.name, this.cities});

  Province.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['cities'] != null) {
      cities = <City>[];
      json['cities'].forEach((v) {
        cities!.add(City.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (cities != null) {
      data['cities'] = cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}