import 'dart:async';

import 'package:e_plaza_delivery_partner/modals/category.dart';
import 'package:e_plaza_delivery_partner/modals/order_details.dart';
import 'package:e_plaza_delivery_partner/modals/product_details.dart';
import 'package:e_plaza_delivery_partner/modals/result.dart';
import 'package:e_plaza_delivery_partner/modals/sub_category.dart';
import 'package:e_plaza_delivery_partner/modals/user.dart';
import 'package:e_plaza_delivery_partner/modals/user_address.dart';
import 'package:e_plaza_delivery_partner/utils/const.dart';

import '../modals/config.dart';
import '../modals/delivery_time.dart';
import 'api_provider.dart';

class Repository {
  static Repository? _instance;

  static Repository get instance {
    _instance ??= Repository._init();
    return _instance!;
  }

  Repository._init();

  Future<bool> getConfig() async {
    var data = await ApiProvider('getConfig').getDynamic();
    if (data['success'] == true) {
      Const.config.value = Config.fromJson(data);
      // Encryption.setNull();
    }
    return true;
  }

  Future<dynamic> login(String email, String password) async {
    return ApiProvider('login', parameters: {'email': email, 'password': password}).getDynamic();
  }

  Future<dynamic> register(String first_name, String last_name, String email, String password,
      String mobile, String user_type, String Zip_code, String social_id) async {
    return ApiProvider('register', parameters: {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
      'mobile': mobile,
      'user_type': user_type,
      'Zip_code': Zip_code,
      'social_id': social_id,
    }).getDynamic();
  }

  Future<dynamic> verifyOtp(String userId, String otp) {
    return ApiProvider('check/otp', parameters: {'user_id': userId, 'otp': otp}).getDynamic();
  }

  Future<dynamic> dashboard(String? id) async {
    return ApiProvider('delivery/dashboard/$id', method: 'get').getDynamic();
  }

  Future<List<dynamic>> getOrders(String? id, int? orderStatus) async {
    return ApiProvider(
            'delivery/new/orders/$id/${orderStatus == OrderStatus.DELIVERED ? 'delivered' : 'new'}',
            method: 'get')
        .getList();
  }

  Future<OrderDetails> getOrderDetails(String orderId) async {
    return OrderDetails.test(
        '0',
        '123456',
        '444444444444',
        '55555555',
        '2023-11-14 12:12:12',
        '2023-11-14 12:12:12',
        '1',
        '200',
        'PENDING',
        'PENDING',
        'COD',
        '',
        '',
        '',
        '1',
        '',
        '2023-11-14 12:12:12',
        '2023-11-14 12:12:12',
        '2023-11-14 12:12:12',
        '2023-11-14 12:12:12',
        ProductDetails.test(
            '',
            '1',
            '2',
            '1',
            'Manish',
            '300',
            '200',
            '2',
            'Nice Product',
            '',
            '',
            '1',
            '1',
            '1',
            'https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/a/6/2/g54-5g-payw0005in-motorola-original-imagt3mekfgqkyk8.jpeg?q=70',
            '',
            '',
            '2023-11-14 12:12:12',
            '2023-11-14 12:12:12',
            Category(),
            SubCategory(),
            DeliveryTime()),
        User.fromJson({'name': 'Manish User'}),
        UserAddress.test(
            address: 'Ghantaghar Dehradun, Uttarakhand',
            addressType: "Home",
            roadNameAreaColony: "Roadname city",
            phoneNo: '1234567890',
            landmark: 'Tes Landmark',
            success: true,
            city: 'Dehradun',
            state: 'Uttarakhand',
            pinCode: '123456'));
  }

  Future<Result> requestOtp(String user_id, num? order_id) async {
    return ApiProvider('delivery/request/opt', method: 'post', parameters: {
      'user_id': user_id,
      'order_id': order_id,
    }).getResult();
  }

  Future<Result> checkOtp(String user_id, num? order_id, String otp) async {
    return ApiProvider('delivery/check/order/otp', method: 'post', parameters: {
      'user_id': user_id,
      'order_id': order_id,
      'otp': otp,
    }).getResult();
  }
}
