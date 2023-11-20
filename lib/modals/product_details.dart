import 'package:e_plaza_delivery_partner/modals/product.dart';

import 'category.dart';
import 'delivery_time.dart';
import 'sub_category.dart';

class ProductDetails {
  String? id;
  String? categoryId;
  String? subCategoryId;
  String? vendorId;
  String? name;
  String? price;
  String? offerPrice;
  String? stockQuantity;
  String? description;
  String? shippingPolicy;
  String? refundPolicy;
  String? isCancelEnabled;
  String? isReturnEnabled;
  String? isExchangeEnabled;
  String? image1;
  String? image2;
  String? image3;
  String? createdAt;
  String? updatedAt;
  late Category category;
  late SubCategory subCategory;
  late DeliveryTime globalDeliveryTime;

  ProductDetails();


  ProductDetails.test(
      this.id,
      this.categoryId,
      this.subCategoryId,
      this.vendorId,
      this.name,
      this.price,
      this.offerPrice,
      this.stockQuantity,
      this.description,
      this.shippingPolicy,
      this.refundPolicy,
      this.isCancelEnabled,
      this.isReturnEnabled,
      this.isExchangeEnabled,
      this.image1,
      this.image2,
      this.image3,
      this.createdAt,
      this.updatedAt,
      this.category,
      this.subCategory,
      this.globalDeliveryTime);

  ProductDetails.fromJson(dynamic json) {
    id = json['id'].toString();
    categoryId = json['category_id'].toString();
    subCategoryId = json['sub_category_id'].toString();
    vendorId = json['vendor_id'].toString();
    name = json['name'].toString();
    price = json['price'].toString();
    offerPrice = json['offer_price'].toString();
    stockQuantity = json['stock_quantity'].toString();
    description = json['description'].toString();
    shippingPolicy = json['shipping_policy'].toString();
    refundPolicy = json['refund_policy'].toString();
    isCancelEnabled = json['is_cancel_enabled'].toString();
    isReturnEnabled = json['is_return_enabled'].toString();
    isExchangeEnabled = json['is_exchange_enabled'].toString();
    image1 = json['image_1'].toString();
    image2 = json['image_2'].toString();
    image3 = json['image_3'].toString();
    createdAt = json['createdAt'].toString();
    updatedAt = json['updatedAt'].toString();
    category = json['category'] != null ? Category.fromJson(json['category']) : Category();
    subCategory =
        json['sub_category'] != null ? SubCategory.fromJson(json['sub_category']) : SubCategory();
    globalDeliveryTime = json['global_delivery_time'] != null
        ? DeliveryTime.fromJson(json['global_delivery_time'])
        : DeliveryTime();
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_id'] = categoryId;
    map['sub_category_id'] = subCategoryId;
    map['vendor_id'] = vendorId;
    map['name'] = name;
    map['price'] = price;
    map['offer_price'] = offerPrice;
    map['stock_quantity'] = stockQuantity;
    map['description'] = description;
    map['shipping_policy'] = shippingPolicy;
    map['refund_policy'] = refundPolicy;
    map['is_cancel_enabled'] = isCancelEnabled;
    map['is_return_enabled'] = isReturnEnabled;
    map['is_exchange_enabled'] = isExchangeEnabled;
    map['image_1'] = image1;
    map['image_2'] = image2;
    map['image_3'] = image3;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (subCategory != null) {
      map['sub_category'] = subCategory?.toJson();
    }
    if (globalDeliveryTime != null) {
      map['global_delivery_time'] = globalDeliveryTime?.toJson();
    }
    return map;
  }
}
