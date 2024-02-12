import 'package:e_plaza_delivery_partner/utils/helper.dart';
import 'package:e_plaza_delivery_partner/values/dimen.dart';
import 'package:e_plaza_delivery_partner/values/size_config.dart';
import 'package:e_plaza_delivery_partner/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../../values/theme_colors.dart';
import '../../widgets/my_network_image.dart';
import '../../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  late double imgSize;

  @override
  Widget build(BuildContext context) {
    imgSize = 30.w;
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          MyAppBar('Profile Screen'),
          Helper.spaceVertical(6.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(imgSize / 2),
            child: MyNetworkImage(
              path:
                  'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg',
              // imageName: Const.profilePic.value,
              width: imgSize,
              height: imgSize,
              open: true,
              errorWidget: assetImage('assets/icons/profile_placeholder_primary.png',
                  width: imgSize, height: imgSize, color: ThemeColors.white, fit: BoxFit.contain),
            ),
          ),
          Helper.spaceVertical(5.h),
          Text(
            'Delivery Boy',
            style: MyTextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          Text(
            'Member since 2023',
            style: MyTextStyle(fontSize: fontSizeSmall),
          ),
          Helper.spaceVertical(8.h),
          _tile('example@gmail.com', Icons.email_outlined),
          _tile('+911234567890', Icons.phone),
        ]),
      ),
    );
  }

  Widget _tile(String title, IconData icon) {
    return Container(
      width: 60.w,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
      alignment: Alignment.center,
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0, 0.4),
        ),
      ]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          Helper.spaceHorizontal(8),
          Text(title, style: MyTextStyle()),
        ],
      ),
    );
  }
}
