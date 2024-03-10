import 'package:e_plaza_delivery_partner/modals/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data_provider/api_keys.dart';

class Const {
  // ignore: constant_identifier_names

  static const PRODUCT_IMAGE_PATH = '${ApiKeys.baseUrl}/images/products/';

  static final RxInt notificationCount = 0.obs;
  static const razorPayKey = 'rzp_test_lOilWsb6wjCV3t';
  static AppLifecycleState lifecycleState = AppLifecycleState.resumed;

  static final Rx<Config> config = Config().obs;
  static RxString name = ''.obs;
  static RxString email = ''.obs;
  static RxString profilePic = ''.obs;
  static double loaderSize = 80;

  static String currencySymbol = 'Rs.';

  static String timeZone = '';
  static String packageName = '';
  static String versionCode = '0';
  static String versionName = '0';

  static String dots = '• • •';

  static final testDeviceIds = ['7ed51f79947ea050', '7804d9f813b8dd79'];
}

class Status {
  // ignore: constant_identifier_names
  static const NORMAL = 'normal';

  // ignore: constant_identifier_names
  static const PROGRESS = 'progress';

  // ignore: constant_identifier_names
  static const EMPTY = 'empty';

  // ignore: constant_identifier_names
  static const ERROR = 'error';

  // ignore: constant_identifier_names
  static const COMPLETED = 'completed';
}

class PaymentStatus {
  static const String CREDIT = 'CREDIT';
  static const String DEBIT = 'DEBIT';
  static const String WITHDRAW = 'WITHDRAW';
}

class PaymentType {
  static const String NEW_ORDER = 'NEW ORDER';
  static const String TIP = 'TIP';
  static const String REFUND = 'REFUND';
  static const String WITHDRAW = 'WITHDRAW';
}

class PaymentMethod {
  static const String PAYPAL = 'PAYPAL';
  static const String STRIPE = 'STRIPE';
  static const String RAZOR_PAY = 'RAZOR PAY';
}

class ContestType {
  static const String UPCOMING = 'UPCOMING';
  static const String LIVE = 'LIVE';
  static const String COMPLETED = 'COMPLETED';
  static const String FULL = 'FULL';
  static const String PLAYED = 'PLAYED';
}

class FileUploadType {
  static const PROFILE_IMG = 'PROFILE_IMG';
  static const FILE = 'FILE';
  static const SMS_IMG = 'SMS_IMG';
}

class PlanType {
  static const String Quarterly = 'Quarterly';
  static const String Yearly = 'Yearly';
}

class OrderStatus {
  static const int NEW = 0;
  static const int ACCEPTED = 1;
  static const int VENDOR_CANCELED = 2;
  static const int USER_CANCELED = 3;
  static const int DELIVERY_PARTNER_ASSIGNED = 4;
  static const int PICKED = 5;
  static const int DELIVERED = 6;

  static String orderStatus(num? orderStatus) {
    switch (orderStatus) {
      case OrderStatus.NEW:
        return "New Order";
      case OrderStatus.ACCEPTED:
        return "Accepted";
      case OrderStatus.VENDOR_CANCELED:
        return "Vendor Canceled";
      case OrderStatus.USER_CANCELED:
        return "User Canceled";
      case OrderStatus.DELIVERY_PARTNER_ASSIGNED:
        return "Delivery Partner Assigned";
      case OrderStatus.PICKED:
        return "Picked";
      case OrderStatus.DELIVERED:
        return "Delivered";
    }

    return '';
  }
}