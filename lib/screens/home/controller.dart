import 'package:e_plaza_delivery_partner/utils/const.dart';
import 'package:e_plaza_delivery_partner/utils/helper.dart';
import 'package:get/get.dart';

import '../../modals/slide.dart';
import '../../modals/subscription.dart';
import '../../utils/preference.dart';

class Controller extends GetxController {
  final RxString status = Status.NORMAL.obs;

  Controller();

  @override
  void onInit() {
    init(showLoader: true);
    super.onInit();
  }

  final RxList<Subscription> subscriptions = <Subscription>[].obs;
  List<Slide> slides = [
    Slide(
        'title', 'https://www.slideteam.net/wp/wp-content/uploads/2020/03/Banner-20-1001x436.png'),
    Slide('title',
        'https://imgscf.slidemembers.com/docs/1/1/214/italian_food_-_free_presentation_template_213726.jpg'),
    Slide('title',
        'https://www.googleslidesthemes.com/images/f/o/o/d/-/food-burger-recipe-menu-google-slides-theme-slide-01-41a76612.webp'),
  ];

  Future<void> init({bool showLoader = false}) async {
    // if (Const.packageName.notEmpty) {
    //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //   Const.packageName = packageInfo.packageName;
    //   Const.versionCode = packageInfo.buildNumber;
    //   Const.versionName = packageInfo.version;
    // }

    Const.name.value = Preference.user.firstName.nullSafe + ' ' + Preference.user.lastName.nullSafe;
    Const.email.value = Preference.user.email.nullSafe;
    Const.profilePic.value = '';
  }
}
