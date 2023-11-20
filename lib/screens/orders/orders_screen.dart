import 'package:e_plaza_delivery_partner/dialogs/deliver_order_dialog.dart';
import 'package:e_plaza_delivery_partner/dialogs/done_dialog.dart';
import 'package:e_plaza_delivery_partner/modals/order.dart';
import 'package:e_plaza_delivery_partner/screens/orders/orders_list.dart';
import 'package:e_plaza_delivery_partner/utils/helper.dart';
import 'package:e_plaza_delivery_partner/values/theme_colors.dart';
import 'package:e_plaza_delivery_partner/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class OrdersScreen extends StatelessWidget {
  final String status;

  OrdersScreen(this.status, {Key? key}) : super(key: key);

  final Controller _controller = Get.put(Controller(), tag: 'OrdersScreenController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.whiteBlue,
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          MyAppBar((status.inCaps) + ' Orders', enableSearch: true),
          Expanded(
              child: OrderList(
            status: status,
            orders: List.generate(10, (index) => Order()),
            deliver: (order) {
              DeliverOrderDialog(onDeliver: () {
                Get.back();
                DoneDialog(
                  title: 'Order Delivered',
                  message: "User identity verified successfully.",
                  buttonText: 'Back',
                  icon: 'assets/icons/checked_icon_round.png',
                  callback: Get.back,
                );
              });
            },
          ))
        ]),
      ),
    );
  }
}
