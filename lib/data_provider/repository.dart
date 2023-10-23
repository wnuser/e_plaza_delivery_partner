import 'dart:async';

import 'package:dio/dio.dart';
import 'package:e_plaza_delivery_partner/utils/const.dart';
import 'package:e_plaza_delivery_partner/utils/helper.dart';
import 'package:e_plaza_delivery_partner/utils/preference.dart';

import '../modals/config.dart';
import '../modals/result.dart';
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
}
