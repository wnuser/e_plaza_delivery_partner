class UserAddress {
  String? id = '';
  String? userId = '';
  String? orderId = '';
  String? address = '';
  String? pinCode = '';
  String? roadNameAreaColony = '';
  String? landmark = '';
  String? city = '';
  String? state = '';
  String? phoneNo = '';
  String? altPhoneNo = '';
  String? addressType = '';
  String? latitude = '';
  String? longitude = '';
  String? createdAt = '';
  String? updatedAt = '';
  bool? success = false;

  UserAddress({this.address = ''});

  UserAddress.test(
      {this.id,
      this.userId,
      this.orderId,
      this.address,
      this.pinCode,
      this.roadNameAreaColony,
      this.landmark,
      this.city,
      this.state,
      this.phoneNo,
      this.altPhoneNo,
      this.addressType,
      this.latitude,
      this.longitude,
      this.createdAt,
      this.updatedAt,
      this.success});

  UserAddress.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    orderId = json['orderId'];
    address = json['address'];
    pinCode = json['pinCode'];
    roadNameAreaColony = json['roadNameAreaColony'];
    landmark = json['landmark'];
    city = json['city'];
    state = json['state'];
    phoneNo = json['phoneNo'];
    altPhoneNo = json['altPhoneNo'];
    addressType = json['addressType'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['orderId'] = orderId;
    map['address'] = address;
    map['pinCode'] = pinCode;
    map['roadNameAreaColony'] = roadNameAreaColony;
    map['landmark'] = landmark;
    map['city'] = city;
    map['state'] = state;
    map['phoneNo'] = phoneNo;
    map['altPhoneNo'] = altPhoneNo;
    map['addressType'] = addressType;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['success'] = success;
    return map;
  }
}
