import 'package:e_plaza_delivery_partner/utils/const.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  RxString status = Status.NORMAL.obs;

  Controller();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
  }
}
