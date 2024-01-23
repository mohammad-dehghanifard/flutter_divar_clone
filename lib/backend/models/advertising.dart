class Advertising {
  int? id;
  String? title;
  String? image;
  String? city;
  String? province;
  String? price;
  String? createdAt;

  Advertising(
      {this.id,
        this.title,
        this.image,
        this.city,
        this.province,
        this.price,
        this.createdAt});

  Advertising.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    city = json['city'];
    province = json['province'];
    price = json['price'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['city'] = city;
    data['province'] = province;
    data['price'] = price;
    data['created_at'] = createdAt;
    return data;
  }
}