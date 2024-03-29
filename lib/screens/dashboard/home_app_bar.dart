import 'package:e_plaza_delivery_partner/dialogs/popup_menu.dart';
import 'package:e_plaza_delivery_partner/utils/helper.dart';
import 'package:e_plaza_delivery_partner/values/size_config.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class HomeAppBar extends StatelessWidget {
  final Function() onMenuClick;

  HomeAppBar({required this.onMenuClick, Key? key}) : super(key: key);

  final double h = 60;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      // height: h,
      padding: EdgeInsets.symmetric(vertical: 16),
      // color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Helper.spaceHorizontal(18),
          // SizedBox(
          //   width: 40,
          //   height: 40,
          //   child: TextButton(
          //     onPressed: onMenuClick,
          //     style: TextButton.styleFrom(padding: EdgeInsets.zero, shape: const CircleBorder()),
          //     child: const Icon(Icons.menu_rounded, color: Colors.black, size: 26),
          //   ),
          // ),
          // Helper.spaceHorizontal(8),
          assetImage('assets/icons/logo.png', height: h / 1.3, fit: BoxFit.fitHeight),
          Spacer(),
          // smallIconImage('assets/icons/cart.png', () {},
          //     iconColor: ThemeColors.colorPrimary, factor: 1.8),
          // Helper.spaceHorizontal(2),
          // smallIconImage('assets/icons/favorite.png', () {},
          //     iconColor: ThemeColors.colorPrimary, factor: 1.8),
          // Helper.spaceHorizontal(2),
          MyPopupMenuButton(
            title: '',
            list: ['Log Out'],
            child: Icon(Icons.more_vert_rounded),
            onSelected: (s) {
              Helper.logOut();
            },
          ),
          Helper.spaceHorizontal(12),
        ],
      ),
    );
  }
}
