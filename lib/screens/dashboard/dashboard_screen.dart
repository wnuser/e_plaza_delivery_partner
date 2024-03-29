import 'package:e_plaza_delivery_partner/screens/dashboard/home_app_bar.dart';
import 'package:e_plaza_delivery_partner/screens/orders/orders_screen.dart';
import 'package:e_plaza_delivery_partner/screens/profile/profile.dart';
import 'package:e_plaza_delivery_partner/utils/preference.dart';
import 'package:e_plaza_delivery_partner/values/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dialogs/deliver_order_dialog.dart';
import '../../utils/const.dart';
import '../../utils/helper.dart';
import '../../utils/toasty.dart';
import '../../values/dimen.dart';
import '../../values/theme_colors.dart';
import '../../widgets/my_network_image.dart';
import '../../widgets/widgets.dart';
import '../orders/orders_list.dart';
import 'controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  final Controller _controller = Get.put<Controller>(Controller(), tag: 'DashboardScreen');
  final double imgSize = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.offWhite,
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBar(onMenuClick: () {}),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  Helper.spaceVertical(3.h),
                  GestureDetector(
                    onTap: () => Get.to(() => ProfileScreen()),
                    child: Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: /* Preference.user.profilePic == Status.PROGRESS
                                ? const CircularProgressIndicator(strokeWidth: 3)
                                :*/
                                  MyNetworkImage(
                                path:
                                    'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg',
                                // imageName: Const.profilePic.value,
                                width: imgSize,
                                height: imgSize,
                                errorWidget: assetImage(
                                    'assets/icons/profile_placeholder_primary.png',
                                    width: imgSize,
                                    height: imgSize,
                                    color: ThemeColors.white,
                                    fit: BoxFit.contain),
                              ),
                            ),
                            Helper.spaceHorizontal(20),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivery Boy',
                                  style: const MyTextStyle(
                                    color: Colors.black,
                                    fontSize: fontSizeExtraLarge,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  Preference.user.email.nullSafe,
                                  style: MyTextStyle(
                                    color: Colors.black,
                                    fontSize: fontSizeSmall,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        alignment: Alignment.center),
                  ),
                  Helper.spaceVertical(3.h),
                  _earningCard(),
                  Helper.spaceVertical(0.7.h),
                  // Helper.spaceVertical(3.h),
                  _grid(),
                  // Helper.spaceVertical(1.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New Orders',
                          style: MyTextStyle(
                              color: Colors.black,
                              fontSize: fontSizeLarge,
                              fontWeight: FontWeight.bold),
                        ),
                        Obx(
                          () => Text(
                            ' (${_controller.newOrdersList.length})',
                            style: MyTextStyle(
                                color: Colors.black,
                                fontSize: fontSizeLarge,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () => Get.to(() => OrdersScreen(OrderStatus.NEW)),
                          style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                              visualDensity: VisualDensity.compact,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          child: Text(
                            'View All',
                            style: MyTextStyle(color: Colors.black, fontSize: fontSizeSmall),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ...List.generate(10, (i) {
                  //   int index = i + 1;
                  //   return Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 4),
                  //     child: ListTile(
                  //       tileColor: ThemeColors.white,
                  //       title: Text(
                  //         'Order No. ' + index.toString(),
                  //         style: MyTextStyle(
                  //           fontSize: fontSizeLarge,
                  //           fontWeight: FontWeight.w600,
                  //         ),
                  //       ),
                  //       subtitle: Text(
                  //         'From Shop No. $index$index',
                  //         style: MyTextStyle(),
                  //       ),
                  //       trailing: TextButton(
                  //         onPressed: () {},
                  //         style: TextButton.styleFrom(
                  //           shape: CircleBorder(),
                  //         ),
                  //         child: Icon(Icons.more_vert_rounded),
                  //       ),
                  //     ),
                  //   );
                  // }),
                  Obx(
                    () {
                      _controller.newOrdersList.length;

                      if(_controller.status.value == Status.PROGRESS) {
                        return progressLayout();
                      }

                      if(_controller.newOrdersList.isEmpty) {
                        return emptyLayout(title: 'No Orders!');
                      }

                      return OrderList(
                        orderStatus: OrderStatus.NEW,
                        orders: _controller.newOrdersList,
                        deliver: (order) {
                          VerifyOtpDialog(
                            orderId: order.id,
                            onDeliver: () {
                              Get.back();
                              // _controller.order = order;
                              Toasty.success('OK OK');
                              // _controller.sendOtp();
                            },
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _grid() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      crossAxisCount: 2,
      childAspectRatio: 5 / 3,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Obx(
          () => _cardItem(_controller.completedOrders.value.toString(), 'Delivered\nOrders',
              'assets/icons/completed_list.png', () {
            Get.to(() => OrdersScreen(OrderStatus.DELIVERED));
          }),
        ),
        Obx(
          () => _cardItem(_controller.newOrders.value.toString(), 'New\nOrders',
              'assets/icons/pending_orders.png', () {
            Get.to(() => OrdersScreen(OrderStatus.NEW));
          }),
        ),
      ],
    );
  }

  Widget _cardItem(
    String title,
    String subTitle,
    String icon,
    VoidCallback callback, {
    double iconSize = 40,
    Color? imageColor,
    double titleSize = fontSizeExtraLarge,
    double subTitleSize = fontSizeSmall,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: _shadow,
      ),
      alignment: Alignment.center,
      child: MyFlatButton(
        onPressed: callback,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            assetImage(icon, width: iconSize, height: iconSize, color: imageColor),
            Helper.spaceVertical(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 25.w,
                  child: Text(
                    title,
                    style: MyTextStyle(fontSize: titleSize, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
                if (subTitle.notEmpty) Helper.spaceVertical(6),
                if (subTitle.notEmpty)
                  Text(
                    subTitle.nullSafe,
                    style: MyTextStyle(fontSize: subTitleSize, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<BoxShadow> get _shadow => [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 4,
          blurRadius: 4,
          offset: Offset(0, 0.4),
        )
      ];

  Widget _earningCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 0.4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Earnings',
                  style: MyTextStyle(
                    fontSize: fontSizeSmall,
                    color: ThemeColors.defaultTextColor.withOpacity(0.7),
                  ),
                ),
                Helper.spaceVertical(2),
                Text(
                  'November 2023',
                  style: MyTextStyle(
                    fontSize: fontSizeLarge,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '₹40,000/-',
                style: MyTextStyle(
                  fontSize: fontSizeExtraLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Helper.spaceVertical(2),
              Text(
                '+ ₹2,000 Incentive',
                style: MyTextStyle(
                  fontSize: fontSizeMini,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
