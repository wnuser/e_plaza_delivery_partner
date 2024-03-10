class NewOrder {
  NewOrder({
      num? id, 
      num? productQuantity, 
      num? totalAmount, 
      num? paymentStatus, 
      num? isDelivered, 
      num? returnStatus, 
      num? refundStatus, 
      num? exchangeStatus, 
      Customer? customer, 
      ShopDetails? shopDetails,}){
    _id = id;
    _productQuantity = productQuantity;
    _totalAmount = totalAmount;
    _paymentStatus = paymentStatus;
    _isDelivered = isDelivered;
    _returnStatus = returnStatus;
    _refundStatus = refundStatus;
    _exchangeStatus = exchangeStatus;
    _customer = customer;
    _shopDetails = shopDetails;
}

  NewOrder.fromJson(dynamic json) {
    _id = json['id'];
    _productQuantity = json['product_quantity'];
    _totalAmount = json['total_amount'];
    _paymentStatus = json['payment_status'];
    _isDelivered = json['is_delivered'];
    _returnStatus = json['return_status'];
    _refundStatus = json['refund_status'];
    _exchangeStatus = json['exchange_status'];
    _customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    _shopDetails = json['shopDetails'] != null ? ShopDetails.fromJson(json['shopDetails']) : null;
  }
  num? _id;
  num? _productQuantity;
  num? _totalAmount;
  num? _paymentStatus;
  num? _isDelivered;
  num? _returnStatus;
  num? _refundStatus;
  num? _exchangeStatus;
  Customer? _customer;
  ShopDetails? _shopDetails;

  num? get id => _id;
  num? get productQuantity => _productQuantity;
  num? get totalAmount => _totalAmount;
  num? get paymentStatus => _paymentStatus;
  num? get isDelivered => _isDelivered;
  num? get returnStatus => _returnStatus;
  num? get refundStatus => _refundStatus;
  num? get exchangeStatus => _exchangeStatus;
  Customer? get customer => _customer;
  ShopDetails? get shopDetails => _shopDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_quantity'] = _productQuantity;
    map['total_amount'] = _totalAmount;
    map['payment_status'] = _paymentStatus;
    map['is_delivered'] = _isDelivered;
    map['return_status'] = _returnStatus;
    map['refund_status'] = _refundStatus;
    map['exchange_status'] = _exchangeStatus;
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    if (_shopDetails != null) {
      map['shopDetails'] = _shopDetails?.toJson();
    }
    return map;
  }

}

class ShopDetails {
  ShopDetails({
      String? shopName, 
      String? city, 
      String? address, 
      String? image1, 
      String? image2, 
      String? shopDescription,}){
    _shopName = shopName;
    _city = city;
    _address = address;
    _image1 = image1;
    _image2 = image2;
    _shopDescription = shopDescription;
}

  ShopDetails.fromJson(dynamic json) {
    _shopName = json['shop_name'];
    _city = json['city'];
    _address = json['address'];
    _image1 = json['image_1'];
    _image2 = json['image_2'];
    _shopDescription = json['shop_description'];
  }
  String? _shopName;
  String? _city;
  String? _address;
  String? _image1;
  String? _image2;
  String? _shopDescription;

  String? get shopName => _shopName;
  String? get city => _city;
  String? get address => _address;
  String? get image1 => _image1;
  String? get image2 => _image2;
  String? get shopDescription => _shopDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['shop_name'] = _shopName;
    map['city'] = _city;
    map['address'] = _address;
    map['image_1'] = _image1;
    map['image_2'] = _image2;
    map['shop_description'] = _shopDescription;
    return map;
  }

}

class Customer {
  Customer({
      String? firstName, 
      String? lastName, 
      String? email, 
      String? mobile, 
      UserAddress? userAddress,}){
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _mobile = mobile;
    _userAddress = userAddress;
}

  Customer.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _userAddress = json['user_address'] != null ? UserAddress.fromJson(json['user_address']) : null;
  }
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _mobile;
  UserAddress? _userAddress;

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get mobile => _mobile;
  UserAddress? get userAddress => _userAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['mobile'] = _mobile;
    if (_userAddress != null) {
      map['user_address'] = _userAddress?.toJson();
    }
    return map;
  }

}

class UserAddress {
  UserAddress({
      String? houseNo, 
      String? colony, 
      String? pinCode, 
      String? landmark, 
      String? state, 
      String? city, 
      String? phone, 
      String? alternatePhone, 
      num? isWork,}){
    _houseNo = houseNo;
    _colony = colony;
    _pinCode = pinCode;
    _landmark = landmark;
    _state = state;
    _city = city;
    _phone = phone;
    _alternatePhone = alternatePhone;
    _isWork = isWork;
}

  UserAddress.fromJson(dynamic json) {
    _houseNo = json['house_no'];
    _colony = json['colony'];
    _pinCode = json['pin_code'];
    _landmark = json['landmark'];
    _state = json['state'];
    _city = json['city'];
    _phone = json['phone'];
    _alternatePhone = json['alternatePhone'];
    _isWork = json['is_work'];
  }
  String? _houseNo;
  String? _colony;
  String? _pinCode;
  String? _landmark;
  String? _state;
  String? _city;
  String? _phone;
  String? _alternatePhone;
  num? _isWork;

  String? get houseNo => _houseNo;
  String? get colony => _colony;
  String? get pinCode => _pinCode;
  String? get landmark => _landmark;
  String? get state => _state;
  String? get city => _city;
  String? get phone => _phone;
  String? get alternatePhone => _alternatePhone;
  num? get isWork => _isWork;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['house_no'] = _houseNo;
    map['colony'] = _colony;
    map['pin_code'] = _pinCode;
    map['landmark'] = _landmark;
    map['state'] = _state;
    map['city'] = _city;
    map['phone'] = _phone;
    map['alternatePhone'] = _alternatePhone;
    map['is_work'] = _isWork;
    return map;
  }

}