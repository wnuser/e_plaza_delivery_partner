import 'package:e_plaza_delivery_partner/modals/new_order.dart';
import 'package:e_plaza_delivery_partner/screens/orders/order_widget.dart';
import 'package:flutter/material.dart';

import '../../modals/order.dart';

// ignore: must_be_immutable
class OrderList extends StatelessWidget {
  int orderStatus;
  List<NewOrder> orders;
  final void Function(NewOrder order)? deliver;

  OrderList({required this.orders, required this.orderStatus, this.deliver, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: orders.map((e) => OrderWidget(status: orderStatus, order: e, deliver: deliver)).toList(),
    );
  }
}
