import 'package:e_plaza_delivery_partner/modals/result.dart';
import 'package:e_plaza_delivery_partner/utils/const.dart';
import 'package:e_plaza_delivery_partner/utils/helper.dart';
import 'package:get/get.dart';

import '../../data_provider/repository.dart';
import '../../dialogs/done_dialog.dart';
import '../../modals/new_order.dart';
import '../../utils/preference.dart';

class Controller extends GetxController {
  RxString status = Status.NORMAL.obs;
  RxList<NewOrder> newOrdersList = <NewOrder>[].obs;
  NewOrder? order = null;
  int? orderStatus;

  Controller(this.orderStatus);

  @override
  void onInit() {
    super.onInit();
    getOrders(first: true);

    Helper.addRefreshCallback('orders', getOrders);
  }

  void getOrders({bool first = false}) async {
    if (first) status.value = Status.PROGRESS;
    var list = await Repository.instance.getOrders(Preference.user.id.toString(), orderStatus);

    if (list.isNotEmpty) {
      list.forEach((element) => newOrdersList.add(NewOrder.fromJson(element)));
    }

    // //TODO: TEMP
    // newOrdersList.addAll(List.generate(12, (index) => dummyOrder));

    status.value = Status.NORMAL;
  }

  void sendOtp() async {
    status.value = Status.PROGRESS;

    Result result = await Repository.instance.requestOtp(Preference.user.id.toString(), order!.id);

    if (result.success) {
      status.value = Status.NORMAL;
      DoneDialog(
        title: 'Order Delivered',
        message: "User identity verified successfully.",
        buttonText: 'Back',
        icon: 'assets/icons/checked_icon_round.png',
        callback: Get.back,
      );
    }
  }

  @override
  void onClose() {
    Helper.removeAutoRefreshCallback('orders');
    super.onClose();
  }
}
