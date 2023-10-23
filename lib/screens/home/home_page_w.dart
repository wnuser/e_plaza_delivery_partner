import 'package:e_plaza_delivery_partner/screens/splash_screen.dart';
import 'package:e_plaza_delivery_partner/utils/const.dart';
import 'package:e_plaza_delivery_partner/utils/helper.dart';
import 'package:e_plaza_delivery_partner/values/size_config.dart';
import 'package:e_plaza_delivery_partner/values/theme_colors.dart';
import 'package:e_plaza_delivery_partner/widgets/custom_bottom_nav_bar.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../values/dimen.dart';
import '../../widgets/my_drawer.dart';
import '../../widgets/widgets.dart';
import '../placeholder_screen.dart';
import 'controller.dart';
import 'home_app_bar.dart';
import 'main_slider.dart';

class HomeScreenWithBottomMenu extends StatefulWidget {
  @override
  _HomeScreenWithBottomMenuState createState() => _HomeScreenWithBottomMenuState();
}

class _HomeScreenWithBottomMenuState extends State<HomeScreenWithBottomMenu> {
  final PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Helper.initAutoRefreshTimer();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: ThemeColors.offWhite,
        body: SafeArea(
          child: PageView.builder(
            controller: _pageController,
            physics: new NeverScrollableScrollPhysics(),
            onPageChanged: (i) {
              CustomBottomNavBar.selectedMenu.value = i;
            },
            itemBuilder: (context, position) {
              switch (position) {
                case 0:
                  return _HomeScreen(
                    openDrawer: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                  );
                case 1:
                  return PlaceholderScreen(placeholder: 'Chat');
                case 2:
                  return PlaceholderScreen(placeholder: '1');
                case 3:
                  return PlaceholderScreen(placeholder: '2');
                default:
                  return SplashScreen();
              }
            },
            itemCount: 4,
          ),
        ),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          // onPressed: () => Get.to(() => ProductListingScreen()),
          // onPressed: () => Get.to(() => ShopDetailsScreen()),
          backgroundColor: ThemeColors.colorPrimary,
          child: Icon(Icons.add, size: 24, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomNavBar(callback: (state) {
          if (state >= 0) {
            CustomBottomNavBar.selectedMenu.value = state;
            _pageController.jumpToPage(state);
          } else {
            // Get.to(() => ProductListingScreen());
          }
        }),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (CustomBottomNavBar.selectedMenu.value != 0) {
      setState(() {
        CustomBottomNavBar.selectedMenu.value = 0;
        _pageController.jumpToPage(CustomBottomNavBar.selectedMenu.value);
      });
    } else {
      Helper.exitAlert();
    }
    return false;
  }
}

////////////////////////////////////////////////////////////

class _HomeScreen extends StatelessWidget {
  final void Function() openDrawer;

  _HomeScreen({required this.openDrawer, Key? key}) : super(key: key);

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final Controller _controller = Get.put(Controller(), tag: 'HomeScreenController');

  final double spacing = 16;

  // int _initialColorIndex = -1;
  //
  // final List<Pair<Color, Color>> _colors = [
  //   Pair(Color.fromRGBO(251, 118, 147, 0.1), Color.fromRGBO(250, 90, 125, 1.0)),
  //   Pair(Color.fromRGBO(84, 246, 151, 0.1), Color.fromRGBO(0, 200, 83, 1.0)),
  //   Pair(Color.fromRGBO(52, 202, 202, 0.1), Color.fromRGBO(26, 176, 176, 1)),
  //   Pair(Color.fromRGBO(255, 137, 96, 0.1), Color.fromRGBO(255, 137, 96, 1)),
  //   Pair(Color.fromRGBO(241, 143, 143, 0.1), Color.fromRGBO(252, 29, 29, 1.0)),
  //   Pair(Color.fromRGBO(241, 189, 144, 0.1), Color.fromRGBO(245, 127, 23, 1.0)),
  //   Pair(Color.fromRGBO(120, 200, 239, 0.1), Color.fromRGBO(3, 155, 229, 1.0)),
  //   Pair(Color.fromRGBO(157, 144, 255, 0.1), Color.fromRGBO(134, 118, 254, 1)),
  //   // Pair(Color.fromRGBO(232, 158, 136, 0.1), Color.fromRGBO(216, 67, 21, 1.0)),
  //   //Pair(Color.fromRGBO(47, 37, 92, 0.1), Color.fromRGBO(52, 53, 118, 0.7)),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          HomeAppBar(onMenuClick: openDrawer),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 40),
              children: [

              ],
            ),
          ),
        ]),
      ),
      // drawer: MyDrawer(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Get.to(() => ProductListingScreen()),
      //   backgroundColor: ThemeColors.colorPrimary,
      //   child: Icon(Icons.add, size: 24, color: Colors.white),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
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
}
