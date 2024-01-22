class User {
  int? id;
  String? name;
  String? mobile;
  String? avatar;
  String? city;
  String? province;
  int? cityId;
  int? provinceId;

  User(
      {this.id,
        this.name,
        this.mobile,
        this.avatar,
        this.city,
        this.province,
        this.cityId,
        this.provinceId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    avatar = json['avatar'];
    city = json['city'];
    province = json['province'];
    cityId = json['city_id'];
    provinceId = json['province_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['avatar'] = avatar;
    data['city'] = city;
    data['province'] = province;
    data['city_id'] = cityId;
    data['province_id'] = provinceId;
    return data;
  }
}