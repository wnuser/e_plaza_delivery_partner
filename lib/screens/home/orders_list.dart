import 'package:e_plaza_delivery_partner/values/size_config.dart';
import 'package:flutter/material.dart';

import '../../dialogs/popup_menu.dart';
import '../../modals/order.dart';
import '../../utils/const.dart';
import '../../utils/helper.dart';
import '../../utils/toasty.dart';
import '../../values/dimen.dart';
import '../../widgets/my_network_image.dart';
import '../../widgets/widgets.dart';

// ignore: must_be_immutable
class OrderList extends StatelessWidget {
  String type;
  List<Order> orders;

  OrderList({required this.orders, required this.type, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: orders.length,
        itemBuilder: _orderItem,
      ),
    );
  }

  Widget _orderItem(BuildContext context, int pos) {
    Order order = orders[pos];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      // decoration: BoxDecoration(
      //   color: ThemeColors.white,
      //   borderRadius: BorderRadius.circular(6),
      //   boxShadow: [
      //     BoxShadow(
      //         color: Colors.grey.shade200,
      //         blurRadius: 1,
      //         spreadRadius: 1,
      //         offset: Offset(0, 1))
      //   ],
      // ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {
              // Get.to(() => OrderDetailsScreen());
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              minimumSize: Size.zero,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Helper.spaceHorizontal(4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: MyNetworkImage(
                    path: order.image,
                    width: 20.w,
                    height: 20.w,
                    fit: BoxFit.fitHeight,
                    open: true,
                    errorWidget: assetImage(
                      'assets/icons/no_product.png',
                      width: 20.w,
                      height: 20.w,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 4),
                //   color: Colors.grey.shade300,
                //   width: 1,
                //   height: 50,
                // ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    order.title.nullStr,
                                    style: MyTextStyle(
                                        fontSize: fontSizeMedium, fontWeight: FontWeight.w600),
                                  ),
                                  Helper.spaceVertical(2),
                                  Text(
                                    order.desc.nullStr,
                                    style: MyTextStyle(
                                        fontSize: fontSizeSmall, color: Colors.grey.shade500),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                            if (type == 'NEW')
                              MyPopupMenuButton<String>(
                                title: 'Action',
                                list: ['Accept', 'Cancel'],
                                onSelected: (s) {
                                  Toasty.info(s);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Icon(Icons.more_vert_rounded, size: 20, color: Colors.black),
                                ),
                              ),
                            if (type == 'COMPLETED')
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Icon(Icons.check_circle_outline_rounded,
                                    color: Colors.lightGreen, size: 18),
                              ),
                            if (type == 'CANCELED')
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Icon(Icons.block, color: Colors.red, size: 18),
                              ),
                          ],
                        ),
                        Helper.spaceVertical(8),
                        // Row(
                        //   mainAxisSize: MainAxisSize.max,
                        //   children: [
                        //     Expanded(child: Divider(color: Colors.grey.shade400, thickness: 0.7))
                        //   ],
                        // ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              Const.currencySymbol + order.cost.toString() + '/-',
                              style: MyTextStyle(
                                  fontSize: fontSizeLarge,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Text(
                              '29 Nov',
                              style:
                                  MyTextStyle(fontSize: fontSizeSmall, color: Colors.grey.shade600),
                            ),
                            Helper.spaceHorizontal(12),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8, left: 25.w),
            child: Divider(height: 0),
          ),
        ],
      ),
    );
  }
}
