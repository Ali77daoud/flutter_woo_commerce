import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/mainscreen_controller.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/view/widget/custom_app_bar.dart';
import 'package:get/get.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);

  final mainController = Get.put(MainScreenController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(builder: (_) {
      return Scaffold(
        appBar: customAppBar(
            fontSize: 25, text: mainController.titles[mainController.i]),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: mainController.i == 0
                    ? Image.asset(
                        'assets/images/home_icon.png',
                        width: 28,
                      )
                    : Image.asset(
                        'assets/images/home_icon_disabled.png',
                        width: 26,
                      ),
                label: ''),
            BottomNavigationBarItem(
                icon: mainController.i == 1
                    ? Image.asset(
                        'assets/images/shopping_icon.png',
                        width: 28,
                      )
                    : Image.asset(
                        'assets/images/shoppinicon_disabled.png',
                        width: 26,
                      ),
                label: ''),
            BottomNavigationBarItem(
                icon: mainController.i == 2
                    ? Image.asset(
                        'assets/images/heart_icon.png',
                        width: 28,
                      )
                    : Image.asset(
                        'assets/images/heart_disabled.png',
                        width: 26,
                      ),
                label: ''),
            BottomNavigationBarItem(
                icon: mainController.i == 3
                    ? Image.asset(
                        'assets/images/profole_icon.png',
                        width: 28,
                      )
                    : Image.asset(
                        'assets/images/user-disabled.png',
                        width: 26,
                      ),
                label: ''),
          ],
          backgroundColor: whiteColor,
          elevation: 10,
          currentIndex: mainController.i,
          type: BottomNavigationBarType.fixed,
          onTap: (index) async {
            mainController.changeIndex(index);
            if (index == 0
                // && (mainController.isGetProducts == true)
                ) {
              // await storeController.getHomePageData();
              // mainController.isGetCart = true;
              // mainController.isGetProducts = false;
              print(0);
            }
            if (index == 1
                // && (mainController.isGetCart == true)
                ) {
              // await storeController.getCart();
              // mainController.isGetCart = false;
              // mainController.isGetProducts = true;
              print(1);
            }
            if (index == 2) {
              // mainController.isGetCart = true;
              // mainController.isGetProducts = true;
              print(2);
            }
            if (index == 3) {
              // mainController.isGetCart = true;
              // mainController.isGetProducts = true;
              print(3);
            }
          },
        ),
        body: mainController.screens[mainController.i],
      );
    });
  }
}
