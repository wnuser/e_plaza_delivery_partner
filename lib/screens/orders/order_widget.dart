import 'package:e_plaza_delivery_partner/utils/const.dart';
import 'package:e_plaza_delivery_partner/utils/helper.dart';
import 'package:e_plaza_delivery_partner/values/dimen.dart';
import 'package:e_plaza_delivery_partner/widgets/widgets.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../modals/new_order.dart';
import '../../utils/toasty.dart';

class OrderWidget extends StatelessWidget {
  final int status;
  final NewOrder order;
  final void Function(NewOrder order)? deliver;
  ExpandableController buyerExpandableController = ExpandableController();
  ExpandableController vendorExpandableController = ExpandableController();

  OrderWidget({required this.order, Key? key, required this.status, this.deliver})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 4,
          blurRadius: 4,
          offset: Offset(0, 1),
        )
      ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  'Shipment Id : #OD${order.id}',
                  style: MyTextStyle(fontSize: fontSizeMedium, fontWeight: FontWeight.w600),
                ),
              ),
              Icon(statusIcon, color: statusColor, size: 12),
              Helper.spaceHorizontal(2),
              Text(
                OrderStatus.orderStatus(status),
                style: MyTextStyle(
                    color: statusColor, fontSize: fontSizeSmall, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Divider(thickness: 0.7),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _tile(
                        'Deliver to : <span style="font-weight:500">${order.customer!.firstName.nullSafe} ${order.customer!.lastName.nullSafe}</span>'),
                    _tile(
                        'Assigned <b>1</b> Packages From ${order.shopDetails!.shopName.nullSafe}'),
                    // _tile('Deliver to \'Ghantaghar dehradun\''),
                    _tile('Payment : ${order.paymentStatus == 0 ? '⟨Unpaid⟩' : '⟨Paid⟩'}'),
                    // _tile('Delivery Time :<b>5 March, 6:30 PM</b>'),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      Helper.openUrl('tel:${order.customer!.mobile.nullSafe}',
                          launchMode: LaunchMode.externalNonBrowserApplication);
                    },
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: CircleBorder(),
                      visualDensity: VisualDensity.compact,
                      minimumSize: Size.zero,
                      padding: EdgeInsets.all(12),
                    ),
                    child: Icon(CupertinoIcons.phone),
                  ),
                  Helper.spaceVertical(6),
                  TextButton(
                    onPressed: () {
                      String query = Uri.encodeComponent(
                          '${order.customer!.userAddress!.houseNo.nullSafe}, ${order.customer!.userAddress!.colony.nullSafe}, ${order.customer!.userAddress!.landmark.nullSafe}, ${order.customer!.userAddress!.city.nullSafe}, ${order.customer!.userAddress!.state.nullSafe}, ${order.customer!.userAddress!.pinCode.nullSafe}');
                      String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";
                      // googleUrl.openAsUrl;
                      Helper.openUrl(googleUrl, onError: (s) {
                        Toasty.failed("Can't open location!");
                      });
                    },
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: CircleBorder(),
                      visualDensity: VisualDensity.compact,
                      minimumSize: Size.zero,
                      padding: EdgeInsets.all(12),
                    ),
                    child: Icon(CupertinoIcons.location),
                  ),
                ],
              ),
            ],
          ),
          Helper.spaceVertical(8),
          buyerAddress,
          Helper.spaceVertical(8),
          shopAddress,
          Helper.spaceVertical(8),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text(
              //   'Price : ₹4000/-',
              //   style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w600),
              // ),
              Spacer(),
              ..._buttons(),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buttons() {
    List<Widget> buttons = <Widget>[];

    // if (status == OrderStatus.NEW) {
    //   buttons.add(OutlinedButton(
    //     onPressed: () {},
    //     style: OutlinedButton.styleFrom(
    //       padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    //       minimumSize: Size.zero,
    //     ),
    //     child: Text(
    //       'Accept',
    //       style: MyTextStyle(fontSize: fontSizeSmall),
    //     ),
    //   ));
    //   buttons.add(Helper.spaceHorizontal(6));
    // }
    // if (status == OrderStatus.NEW) {
    //   buttons.add(OutlinedButton(
    //     onPressed: () {
    //       CancellationReasonDialog(
    //         reasons: [
    //           'My Mood has changes',
    //           'I am busy',
    //           'I am resign from my job',
    //           'Bhad me jao',
    //           'Other'
    //         ].toSet(),
    //         onSubmit: (String reason) {
    //           Get.back();
    //           Toasty.info(reason);
    //         },
    //       );
    //     },
    //     style: OutlinedButton.styleFrom(
    //       padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    //       minimumSize: Size.zero,
    //     ),
    //     child: Text(
    //       'Reject',
    //       style: MyTextStyle(fontSize: fontSizeSmall),
    //     ),
    //   ));
    //   buttons.add(Helper.spaceHorizontal(6));
    // }
    if (status != OrderStatus.DELIVERED) {
      buttons.add(OutlinedButton(
        onPressed: () {
          deliver?.call(order);
        },
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          minimumSize: Size.zero,
        ),
        child: Text(
          'Deliver',
          style: MyTextStyle(fontSize: fontSizeSmall),
        ),
      ));
      buttons.add(Helper.spaceHorizontal(6));
    }
    // if (status == OrderStatus.DELIVERED) {
    //   buttons.add(OutlinedButton(
    //     onPressed: () {},
    //     style: OutlinedButton.styleFrom(
    //       padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    //       minimumSize: Size.zero,
    //     ),
    //     child: Text(
    //       'Invoice',
    //       style: MyTextStyle(fontSize: fontSizeSmall),
    //     ),
    //   ));
    //   buttons.add(Helper.spaceHorizontal(6));
    // }
    return buttons;
  }

  Widget _tile(
    String text, {
    double fontSize = fontSizeMedium,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.circle, color: Colors.grey.shade500, size: 8),
          Helper.spaceHorizontal(6),
          Expanded(
            child: Html(
              data: text, shrinkWrap: true,
              style: {"body": Style(margin: Margins.all(0))},
              onLinkTap: (_, __, ___) {
                Helper.openUrl(_.nullSafe, launchMode: LaunchMode.externalNonBrowserApplication);
              },
              // , style: MyTextStyle(fontSize: fontSize, fontWeight: fontWeight),
            ),
          ),
        ],
      ),
    );
  }

  Widget get buyerAddress => ExpandablePanel(
        controller: buyerExpandableController,
        header: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Buyer Details',
              style: MyTextStyle(
                  fontWeight: FontWeight.w600, color: Colors.blue, fontSize: fontSizeLarge),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.blue),
          ],
        ),
        collapsed: empty(),
        theme: ExpandableThemeData(hasIcon: false),
        expanded: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Html(
                data:
                    '<span style="font-weight:500">${order.customer!.firstName.nullSafe} ${order.customer!.lastName.nullSafe} </span>',
                style: {"body": Style(margin: Margins.all(2))}),
            Html(
                data: order.customer!.userAddress!.houseNo.nullSafe +
                    ', ' +
                    order.customer!.userAddress!.colony.nullSafe,
                style: {"body": Style(margin: Margins.all(2))}),
            Html(
                data: order.customer!.userAddress!.landmark.nullSafe,
                style: {"body": Style(margin: Margins.all(2))}),
            Html(
                data:
                    '${order.customer!.userAddress!.city.nullSafe}, ${order.customer!.userAddress!.state.nullSafe} - ${order.customer!.userAddress!.pinCode.nullSafe}',
                style: {"body": Style(margin: Margins.all(2))}),
            Html(
                data:
                    'Phone Number: ${order.customer!.userAddress!.phone.nullSafe}, ${order.customer!.userAddress!.alternatePhone.nullSafe}',
                style: {"body": Style(margin: Margins.all(2))}),
            Html(
                data: 'Note : Beaver of dog! Enter in our area on your own risk!',
                style: {"body": Style(margin: Margins.all(2))}),
          ],
        ),
      );

  Widget get shopAddress => ExpandablePanel(
        controller: vendorExpandableController,
        header: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Pickup Address',
              style: MyTextStyle(
                  fontWeight: FontWeight.w600, color: Colors.blue, fontSize: fontSizeLarge),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.blue),
          ],
        ),
        collapsed: empty(),
        theme: ExpandableThemeData(hasIcon: false),
        expanded: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Html(
                data:
                    '<span style="font-weight:500">${order.shopDetails!.shopName.nullSafe}</span>',
                style: {"body": Style(margin: Margins.all(2))}),
            // Html(data: '35, Gandhi Rd', style: {"body": Style(margin: Margins.all(2))}),
            Html(
                data: '${order.shopDetails!.address.nullSafe}',
                style: {"body": Style(margin: Margins.all(2))}),
            Html(
                data: '${order.shopDetails!.city.nullSafe}',
                style: {"body": Style(margin: Margins.all(2))}),
            Html(
                data: 'Vendor Contact: 1234567890', style: {"body": Style(margin: Margins.all(2))}),
          ],
        ),
      );

  IconData get statusIcon {
    switch (status) {
      case OrderStatus.NEW:
        return Icons.new_releases;
      case OrderStatus.PICKED:
        return CupertinoIcons.time;
      case OrderStatus.DELIVERED:
        return CupertinoIcons.check_mark_circled_solid;
      case OrderStatus.USER_CANCELED:
      case OrderStatus.VENDOR_CANCELED:
        return Icons.error_outline_rounded;
    }

    return Icons.access_time_filled;
  }

  Color get statusColor {
    switch (status) {
      case OrderStatus.PICKED:
        return Colors.amber;
      case OrderStatus.DELIVERED:
        return Colors.green;
      case OrderStatus.USER_CANCELED:
      case OrderStatus.VENDOR_CANCELED:
        return Colors.red;
    }

    return Colors.grey;
  }
}
