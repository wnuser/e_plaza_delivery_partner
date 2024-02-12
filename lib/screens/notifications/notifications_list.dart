import 'package:e_plaza_delivery_partner/values/theme_colors.dart';
import 'package:e_plaza_delivery_partner/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationsList extends StatelessWidget {
  NotificationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: List.generate(
          20,
          (index) => ListTile(
                leading: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ThemeColors.colorPrimary.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(CupertinoIcons.bell_fill, color: ThemeColors.colorPrimary),
                ),
                title: Text('Notification ${index + 1}', style: MyTextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
    );
  }
}
