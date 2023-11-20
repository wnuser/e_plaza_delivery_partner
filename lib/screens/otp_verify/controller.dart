import 'package:e_plaza_delivery_partner/screens/dashboard/dashboard_screen.dart';
import 'package:e_plaza_delivery_partner/utils/const.dart';
import 'package:e_plaza_delivery_partner/utils/helper.dart';
import 'package:get/get.dart';
// import 'package:package_info_plus/package_info_plus.dart';

import '../../data_provider/repository.dart';
import '../../modals/user.dart';
import '../../utils/preference.dart';
import '../../utils/toasty.dart';

class Controller extends GetxController {
  final RxString status = Status.NORMAL.obs;

  String ENTERED_OTP = '';

  String userId = '';

  Controller();

  @override
  void onInit() {
    super.onInit();
  }

  void verify() async {
    if (ENTERED_OTP.length != 6) {
      Toasty.failed('Please enter valid 6 digit otp!');
      return;
    }

    status.value = Status.PROGRESS;
    var response = await Repository.instance.verifyOtp(userId, ENTERED_OTP);

    if (response['success'] == true) {
      // User user = User.fromJson(response['data'][0]);
      Preference.setLogin(true);
      // Preference.setUser(user);
      Preference.token = response['jsontoken'];
      Toasty.success(response['message'].toString().placeholder('somethingWentWrong'.t));
      Get.offAll(() => DashboardScreen());
    } else {
      Toasty.failed(response['message'].toString().placeholder('somethingWentWrong'.t));
    }
    status.value = Status.NORMAL;
  }
}
