import 'package:e_plaza_delivery_partner/modals/product.dart';

import 'category.dart';

class ShopDetails {
  String? id;
  String? vendorId;
  String? shopName;
  String? city;
  String? address;
  String? image1;
  String? image2;
  String? aadharCardNumber;
  String? aadharImage;
  String? businessType;
  String? turnOver;
  String? categoryId;
  String? isGrahudhyog;
  String? createdAt;
  String? updatedAt;
  late Category category;

  ShopDetails();

  ShopDetails.fromJson(dynamic json) {
    id = json['id'].toString();
    vendorId = json['vendor_id'].toString();
    shopName = json['shop_name'].toString();
    city = json['city'].toString();
    address = json['address'].toString();
    image1 = json['image_1'].toString();
    image2 = json['image_2'].toString();
    aadharCardNumber = json['aadhar_card_number'].toString();
    aadharImage = json['aadhar_image'].toString();
    businessType = json['business_type'].toString();
    turnOver = json['turn_over'].toString();
    categoryId = json['category_id'].toString();
    isGrahudhyog = json['is_grahudhyog'].toString();
    createdAt = json['createdAt'].toString();
    updatedAt = json['updatedAt'].toString();
    category = json['category'] != null ? Category.fromJson(json['category']) : Category();
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['vendor_id'] = vendorId;
    map['shop_name'] = shopName;
    map['city'] = city;
    map['address'] = address;
    map['image_1'] = image1;
    map['image_2'] = image2;
    map['aadhar_card_number'] = aadharCardNumber;
    map['aadhar_image'] = aadharImage;
    map['business_type'] = businessType;
    map['turn_over'] = turnOver;
    map['category_id'] = categoryId;
    map['is_grahudhyog'] = isGrahudhyog;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
