import 'package:e_plaza_delivery_partner/modals/new_order.dart';
import 'package:e_plaza_delivery_partner/utils/const.dart';
import 'package:e_plaza_delivery_partner/utils/helper.dart';
import 'package:get/get.dart';

import '../../data_provider/repository.dart';
import '../../utils/preference.dart';

class Controller extends GetxController {
  RxString status = Status.PROGRESS.obs;
  RxInt newOrders = 0.obs;
  RxInt completedOrders = 0.obs;
  RxList<NewOrder> newOrdersList = <NewOrder>[].obs;

  Controller();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    getDashboardStatus();
    getNewOrders(first: true);

    Helper.addRefreshCallback('dashboard', () {
      getDashboardStatus();
      getNewOrders();
    });
  }

  void getDashboardStatus() async {
    dynamic dashboard = await Repository.instance.dashboard(Preference.user.id.toString());
    if (dashboard != null && dashboard['success']) {
      var data = dashboard['data'];

      newOrders.value = data['newOrders'];
      completedOrders.value = data['completedOrders'];
    }
  }

  void getNewOrders({bool first = false}) async {
    if(first) status.value = Status.PROGRESS;
    var list = await Repository.instance.getOrders(Preference.user.id.toString(), OrderStatus.NEW);

    if (list.isNotEmpty) {
      list.forEach((element) {
        newOrdersList.add(NewOrder.fromJson(element));
      });
    }

    //TODO: TEMP
    // newOrdersList.addAll(List.generate(12, (index) => dummyOrder));

    status.value = Status.NORMAL;
  }

  @override
  void onClose() {
    Helper.removeAutoRefreshCallback('dashboard');
    super.onClose();
  }
}
