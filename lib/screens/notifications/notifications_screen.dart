import 'package:e_plaza_delivery_partner/values/theme_colors.dart';
import 'package:e_plaza_delivery_partner/widgets/app_bar.dart';
import 'package:e_plaza_delivery_partner/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import 'controller.dart';
import 'notifications_list.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({Key? key}) : super(key: key);

  final Controller _controller = Get.put(Controller(), tag: 'NotificationsScreenController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.whiteBlue,
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          MyAppBar('Notifications', enableSearch: true),
          Expanded(
              child: Stack(
            children: [
              NotificationsList(),
              Obx(() => _controller.status.value == Status.PROGRESS ? progressLayout() : empty()),
            ],
          ))
        ]),
      ),
    );
  }
}
