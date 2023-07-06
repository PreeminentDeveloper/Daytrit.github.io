import 'dart:convert';

class VendorModel {
  int? id;
  String? title;
  String? state;
  String? country;
  String? address;
  String? rating;
  String? photo;
  String? photo2;
  String? photo3;
  String? photo4;
  String? coinPrice;
  String? cashPrice;
  String? description;
  String? features;
  String? type;
  List<String>? requiredCheckoutField;
  String? createdAt;
  String? updatedAt;

  VendorModel(
      {this.id,
      this.title,
      this.state,
      this.country,
      this.address,
      this.rating,
      this.photo,
      this.photo2,
      this.photo3,
      this.photo4,
      this.coinPrice,
      this.cashPrice,
      this.description,
      this.features,
      this.type,
      this.requiredCheckoutField,
      this.createdAt,
      this.updatedAt});

  VendorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    state = json['state'];
    country = json['country'];
    address = json['address'];
    rating = json['rating'];
    photo = json['photo'];
    photo2 = "${json['photo_2']}";
    photo3 = "${json['photo_3']}";
    photo4 = "${json['photo_4']}";
    coinPrice = json['coin_price'];
    cashPrice = json['cash_price'];
    description = json['description'];
    features = json['features'];
    type = json['type'];
    requiredCheckoutField = json['required_checkout_field'] != null
        ? jsonDecode(json['required_checkout_field'].toString()).cast<String>()
        : [];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['state'] = state;
    data['country'] = country;
    data['address'] = address;
    data['rating'] = rating;
    data['photo'] = photo;
    data['photo_2'] = photo2;
    data['photo_3'] = photo3;
    data['photo_4'] = photo4;
    data['coin_price'] = coinPrice;
    data['cash_price'] = cashPrice;
    data['description'] = description;
    data['features'] = features;
    data['type'] = type;
    data['required_checkout_field'] = requiredCheckoutField;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
