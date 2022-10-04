import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/logic/controllers/mainscreen_controller.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import 'package:flutter_woocommerce/view/widget/custom_app_bar.dart';
import 'package:flutter_woocommerce/view/widget/text_widget.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final maincontroller = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: GetBuilder<MainScreenController>(builder: (_) {
          return Scaffold(
            appBar: customAppBar(
                fontSize: 25, text: maincontroller.titles[maincontroller.i]),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: maincontroller.i == 0
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
                    icon: maincontroller.i == 1
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
                    icon: maincontroller.i == 2
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
                    icon: maincontroller.i == 3
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
              currentIndex: maincontroller.i,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                maincontroller.changeIndex(index);
              },
            ),
            body: maincontroller.screens[maincontroller.i],
          );
        }),
      ),
    );
  }
}
