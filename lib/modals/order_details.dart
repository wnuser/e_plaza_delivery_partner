
import 'product_details.dart';
import 'user.dart';
import 'user_address.dart';

class OrderDetails {
  String id = '';
  String userId = '';
  String orderId = '';
  String productId = '';
  String orderCreatedAt = '';
  String deliveredAt = '';
  String quantity = '';
  String totalPrice = '';
  String orderStatus = '';
  String paymentStatus = '';
  String paymentType = '';
  String canceledBy = '';
  String canceledReason = '';
  String canceledDate = '';
  String assignedDriverId = '';
  String note = '';
  String assignedAt = '';
  String expectedDeliveryTime = '';
  String createdAt = '';
  String updatedAt = '';
  ProductDetails product = ProductDetails();
  User buyer = User();
  UserAddress buyerAddress = UserAddress();

  OrderDetails();


  OrderDetails.test(
      this.id,
      this.userId,
      this.orderId,
      this.productId,
      this.orderCreatedAt,
      this.deliveredAt,
      this.quantity,
      this.totalPrice,
      this.orderStatus,
      this.paymentStatus,
      this.paymentType,
      this.canceledBy,
      this.canceledReason,
      this.canceledDate,
      this.assignedDriverId,
      this.note,
      this.assignedAt,
      this.expectedDeliveryTime,
      this.createdAt,
      this.updatedAt,
      this.product,
      this.buyer,
      this.buyerAddress);

  OrderDetails.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    orderId = json['orderId'];
    productId = json['productId'];
    orderCreatedAt = json['orderCreatedAt'];
    deliveredAt = json['deliveredAt'];
    quantity = json['quantity'];
    totalPrice = json['totalPrice'];
    orderStatus = json['orderStatus'];
    paymentStatus = json['paymentStatus'];
    paymentType = json['paymentType'];
    canceledBy = json['canceledBy'];
    canceledReason = json['canceledReason'];
    canceledDate = json['canceledDate'];
    assignedDriverId = json['assignedDriverId'];
    note = json['note'];
    assignedAt = json['assignedAt'];
    expectedDeliveryTime = json['expectedDeliveryTime'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    product = json['product'] != null ? ProductDetails.fromJson(json['product']) : ProductDetails();
    buyer = json['buyer'] != null ? User.fromJson(json['buyer']) : User();
    buyerAddress = json['buyerAddress'] != null ? UserAddress.fromJson(json['buyerAddress']) : UserAddress();
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['orderId'] = orderId;
    map['productId'] = productId;
    map['orderCreatedAt'] = orderCreatedAt;
    map['deliveredAt'] = deliveredAt;
    map['quantity'] = quantity;
    map['totalPrice'] = totalPrice;
    map['orderStatus'] = orderStatus;
    map['paymentStatus'] = paymentStatus;
    map['paymentType'] = paymentType;
    map['canceledBy'] = canceledBy;
    map['canceledReason'] = canceledReason;
    map['canceledDate'] = canceledDate;
    map['assignedDriverId'] = assignedDriverId;
    map['note'] = note;
    map['assignedAt'] = assignedAt;
    map['expectedDeliveryTime'] = expectedDeliveryTime;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (product != null) {
      map['product'] = product.toJson();
    }
    if (buyer != null) {
      map['buyer'] = buyer.toJson();
    }
    if (buyerAddress != null) {
      map['buyerAddress'] = buyerAddress.toJson();
    }
    return map;
  }
}