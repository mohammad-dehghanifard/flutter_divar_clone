class AdsDetail {
  int? id;
  String? title;
  String? image;
  String? city;
  String? province;
  String? price;
  String? category;
  String? description;
  ContactInfo? contactInfo;
  String? createdAt;

  AdsDetail(
      {this.id,
        this.title,
        this.image,
        this.city,
        this.province,
        this.price,
        this.category,
        this.description,
        this.contactInfo,
        this.createdAt});

  AdsDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    city = json['city'];
    province = json['province'];
    price = json['price'];
    category = json['category'];
    description = json['description'];
    if (json['contact_info'] != null) {
      contactInfo = ContactInfo.fromJson(json['contact_info']);
    } else {
      contactInfo = null;
    }
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
    data['category'] = category;
    data['description'] = description;
    if (contactInfo != null) {
      data['contact_info'] = contactInfo!.toJson();
    }
    data['created_at'] = createdAt;
    return data;
  }
}

class ContactInfo {
  String? mobile;
  String? address;

  ContactInfo({this.mobile, this.address});

  ContactInfo.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile'] = mobile;
    data['address'] = address;
    return data;
  }
}