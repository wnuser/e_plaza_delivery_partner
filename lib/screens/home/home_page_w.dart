import 'package:e_plaza_delivery_partner/screens/home/orders_list.dart';
import 'package:e_plaza_delivery_partner/utils/helper.dart';
import 'package:e_plaza_delivery_partner/values/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../values/dimen.dart';
import '../../values/theme_colors.dart';
import '../../widgets/widgets.dart';
import 'controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  final Controller _controller = Get.put(Controller(), tag: 'HomeScreenController');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final double spacing = 16;

  // int _initialColorIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      backgroundColor: ThemeColors.white,
      // body: SafeArea(
      //   child: Column(mainAxisSize: MainAxisSize.max, children: [
      //     HomeAppBar(onMenuClick: () {}),
      //     Helper.spaceVertical(12),
      //     _grid(
      //       [
      //         _cardItem('20', 'New Orders', 'assets/icons/active_services.png', () {}),
      //         _cardItem('20', 'Completed orders', 'assets/icons/inactive_services.png', () {}),
      //         // _cardItem('2', 'Payments', 'assets/icons/payments.png', () {}),
      //         // _cardItem('2', 'Customers', 'assets/icons/customers.png', () {}),
      //       ],
      //     ),
      //   ]),
      // ),
      appBar: AppBar(
        title: const Text(
          'E Plaza Deliver Partner',
          style: MyTextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: smallIcon(
          Icons.menu,
          () {},
          iconSize: 24,
          imageColor: Colors.white,
        ),
        leadingWidth: 50,
        actions: [
          smallIcon(CupertinoIcons.bell_fill, () {}, iconSize: 18, imageColor: Colors.white),
          Helper.spaceHorizontal(12)
        ],
        bottom: TabBar(
          controller: _tabController,
          dividerColor: Colors.white,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          dragStartBehavior: DragStartBehavior.start,
          tabs: ['New Orders', 'Completed', 'Canceled'].map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(e,
                  style: MyTextStyle(
                    color: Colors.white,
                    fontSize: fontSizeMedium,
                    fontWeight: FontWeight.w600,
                  )),
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          OrderList(orders: _controller.orders, type: 'NEW'),
          OrderList(orders: _controller.orders.reversed.toList(), type: 'COMPLETED'),
          OrderList(orders: _controller.orders.take(15).toList().reversed.toList(), type: 'CANCELED'),
        ],
      ),
    );
  }

  Widget _cardItem(
    String title,
    String? subTitle,
    String icon,
    VoidCallback callback, {
    Color? imageColor,
    double titleSize = fontSizeExtraLarge,
    double subTitleSize = fontSizeMini,
    bool swap = false,
  }) {
    if (swap) {
      String a = title;
      title = subTitle!;
      subTitle = a;
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 0.3),
          )
        ],
      ),
      alignment: Alignment.center,
      child: MyFlatButton(
        onPressed: callback,
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            assetImage(icon, width: 40, height: 40, color: imageColor),
            Helper.spaceVertical(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 25.w,
                  child: Text(
                    title,
                    style: MyTextStyle(
                        color: Colors.black, fontSize: titleSize, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
                if (subTitle != null) Helper.spaceVertical(6),
                if (subTitle != null)
                  Text(
                    subTitle.nullSafe,
                    style: MyTextStyle(
                        color: Colors.black, fontSize: subTitleSize, fontWeight: FontWeight.w500),
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

  Widget _grid(List<Widget> list) {
    return GridView.count(
        shrinkWrap: true,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.symmetric(horizontal: spacing),
        crossAxisCount: 2,
        childAspectRatio: 2 / 1,
        physics: NeverScrollableScrollPhysics(),
        children: list);
  }
}
