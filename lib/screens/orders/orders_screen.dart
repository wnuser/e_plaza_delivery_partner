import 'package:e_plaza_delivery_partner/dialogs/deliver_order_dialog.dart';
import 'package:e_plaza_delivery_partner/screens/orders/orders_list.dart';
import 'package:e_plaza_delivery_partner/utils/helper.dart';
import 'package:e_plaza_delivery_partner/values/theme_colors.dart';
import 'package:e_plaza_delivery_partner/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import '../../widgets/widgets.dart';
import 'controller.dart';

class OrdersScreen extends StatefulWidget {
  final int orderStatus;

  OrdersScreen(this.orderStatus, {Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final Controller _controller = Get.put(Controller(), tag: 'OrdersScreenController');

  @override
  void initState() {
    super.initState();
    _controller.getOrders(widget.orderStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.whiteBlue,
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          MyAppBar((OrderStatus.orderStatus(widget.orderStatus)) + ' Orders', enableSearch: true),
          Helper.spaceVertical(12),
          Expanded(child: Obx(
            () {
              if (_controller.status.value == Status.PROGRESS) {
                return progressLayout();
              }

              if (_controller.newOrdersList.isEmpty) {
                return emptyLayout();
              }

              return OrderList(
                orderStatus: widget.orderStatus,
                orders: _controller.newOrdersList,
                deliver: (order) {
                  VerifyOtpDialog(
                      orderId: order.id,
                      onDeliver: () {
                        Get.back();
                        _controller.order = order;
                        // _controller.sendOtp();
                      });
                },
              );
            },
          ))
        ]),
      ),
    );
  }
}
