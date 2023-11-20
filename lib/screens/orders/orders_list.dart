import 'package:e_plaza_delivery_partner/screens/orders/order_widget.dart';
import 'package:flutter/material.dart';

import '../../modals/order.dart';

// ignore: must_be_immutable
class OrderList extends StatelessWidget {
  String status;
  List<Order> orders;
  final void Function(Order order)? deliver;

  OrderList({required this.orders, required this.status, this.deliver, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: orders.map((e) => OrderWidget(status: status, order: e, deliver: deliver)).toList(),
    );
  }
}
