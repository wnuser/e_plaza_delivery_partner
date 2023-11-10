import 'package:e_plaza_delivery_partner/utils/const.dart';
import 'package:e_plaza_delivery_partner/utils/helper.dart';
import 'package:get/get.dart';

import '../../modals/order.dart';
import '../../modals/slide.dart';
import '../../modals/subscription.dart';
import '../../utils/preference.dart';

class Controller extends GetxController {
  final RxString status = Status.NORMAL.obs;
  final RxList<Order> orders = <Order>[].obs;

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

    getOrders();
  }

  void getOrders() async {
    orders.clear();
    orders.addAll([
      Order(
          "POCO X5 5G (Supernova Green, 256 GB) ",
          "14,999",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/h/i/0/-original-imagnqpnhtwr8chu.jpeg?q=70",
          "8 GB RAM | 256 GB ROM | Expandable Upto 1 TB "),
      Order(
          "POCO X5 5G (Wildcat Blue, 256 GB)",
          "14,999",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/f/e/l/-original-imagnqpndcmxghyq.jpeg?q=70",
          "8 GB RAM | 256 GB ROM | Expandable Upto 1 TB "),
      Order(
          "OnePlus Nord CE 2 Lite 5G (Blue Tide, 128 GB)",
          "17,199",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/k/w/k/-original-imagg2abzhxjckxu.jpeg?q=70",
          "6 GB RAM | 128 GB ROM"),
      Order(
          "MOTOROLA e13 (Aurora Green, 128 GB)",
          "7,499",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/s/y/n/-original-imagshuzkeurgwd8.jpeg?q=70",
          "8 GB RAM | 128 GB ROM | Expandable Upto 1 TB "),
      Order(
          "MOTOROLA g54 5G (Mint Green, 256 GB) ",
          "15,999",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/a/6/2/g54-5g-payw0005in-motorola-original-imagt3mekfgqkyk8.jpeg?q=70",
          "12 GB RAM | 256 GB ROM | Expandable Upto 1 TB"),
      Order(
          "MOTOROLA e13 (Aurora Green, 64 GB) ",
          "6,499",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/i/8/5/-original-imagmmmhmjpfvbry.jpeg?q=70",
          "4 GB RAM | 64 GB ROM | Expandable Upto 1 TB"),
      Order(
          "Infinix SMART 7 (Azure Blue, 128 GB) ",
          "6,699",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/c/t/4/-original-imagrqg4ahf36sng.jpeg?q=70",
          "4 GB RAM | 128 GB ROM | Expandable Upto 512 GB "),
      Order(
          "POCO X5 5G (Supernova Green, 128 GB) ",
          "13,999",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/h/i/0/-original-imagnqpnhtwr8chu.jpeg?q=70",
          "6 GB RAM | 128 GB ROM | Expandable Upto 1 TB "),
      Order(
          "POCO C51 - Locked with Airtel Prepaid (Royal Blue, 64 GB)",
          "5,499",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/9/i/h/-original-imagt4tdvvhyag9j.jpeg?q=70",
          "4 GB RAM | 64 GB ROM | Expandable Upto 1 TB"),
      Order(
          "POCO C55 (Cool Blue, 128 GB) ",
          "7,799",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/y/9/g/-original-imagnfzyhh8gz8sd.jpeg?q=70",
          "6 GB RAM | 128 GB ROM | Expandable Upto 1 TB "),
      Order(
          "POCO X5 5G (Jaguar Black, 256 GB)",
          "14,999",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/8/q/q/-original-imagnqpnkkzmgv7h.jpeg?q=70",
          "8 GB RAM | 256 GB ROM | Expandable Upto 1 TB "),
      Order(
          "POCO X5 Pro 5G (Horizon Blue, 256 GB)",
          "19,499",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/n/v/2/-original-imagmkjfjwtzhaag.jpeg?q=70",
          "8 GB RAM | 256 GB ROM"),
      Order(
          "POCO C51 (Royal Blue, 64 GB) ",
          "5,999",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/6/v/0/c51-mzb0dxkin-poco-original-imagzdpycgrcdc8z.jpeg?q=70",
          "4 GB RAM | 64 GB ROM | Expandable Upto 1 TB"),
      Order(
          "MOTOROLA g14 (Pale Lilac, 128 GB)",
          "8,499",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/z/v/2/-original-imagsmshnfvucsvc.jpeg?q=70",
          "4 GB RAM | 128 GB ROM | Expandable Upto 1 TB "),
      Order(
          "MOTOROLA g54 5G (Midnight Blue, 128 GB)",
          "13,999",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/u/g/j/-original-imagt5uejuxw2ytm.jpeg?q=70",
          "8 GB RAM | 128 GB ROM | Expandable Upto 1 TB "),
      Order(
          "realme C53 (Champion Gold, 128 GB) ",
          "10,999",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/h/h/d/-original-imags487gaqqhcea.jpeg?q=70",
          "6 GB RAM | 128 GB ROM | Expandable Upto 2 TB "),
      Order(
          "POCO X5 Pro 5G (Yellow, 256 GB)",
          "19,499",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/d/s/8/-original-imagmkjf9wqjurgf.jpeg?q=70",
          "8 GB RAM | 256 GB ROM"),
      Order(
          "POCO X5 Pro 5G (Horizon Blue, 128 GB)",
          "18,499",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/n/v/2/-original-imagmkjfjwtzhaag.jpeg?q=70",
          "6 GB RAM | 128 GB ROM"),
      Order(
          "Infinix SMART 7 (Night Black, 128 GB)",
          "6,699",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/q/p/c/-original-imagrqg4tzgvvjzy.jpeg?q=70",
          "4 GB RAM | 128 GB ROM | Expandable Upto 512 GB "),
      Order(
          "REDMI A2 (Sea Green, 64 GB)",
          "6,999",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/b/g/t/a2-mobzc1pin-redmi-original-imagpvyagktrdava.jpeg?q=70",
          "4 GB RAM | 64 GB ROM "),
      Order(
          "POCO X5 Pro 5G (Astral Black, 128 GB)",
          "18,499",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/a/x/j/-original-imagmkjfhzjhfhhe.jpeg?q=70",
          "6 GB RAM | 128 GB ROM"),
      Order(
          "POCO X5 Pro 5G (Yellow, 128 GB)",
          "18,499",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/d/s/8/-original-imagmkjf9wqjurgf.jpeg?q=70",
          "6 GB RAM | 128 GB ROM"),
      Order(
          "realme C51 (Mint Green, 64 GB) ",
          "7,999",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/b/i/x/-original-imagt4qptrkzwmxa.jpeg?q=70",
          "4 GB RAM | 64 GB ROM | Expandable Upto 2 TB"),
      Order(
          "MOTOROLA g14 (Sky Blue, 128 GB)",
          "8,499",
          "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/j/i/z/g14-payf0011in-motorola-original-imagrtypz3qqy3hg.jpeg?q=70",
          "4 GB RAM | 128 GB ROM | Expandable Upto 1 TB "),
    ]);
    status.value = Status.NORMAL;
  }
}
